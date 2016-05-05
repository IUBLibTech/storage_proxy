## Overview

This application provides a simple RESTful API that mocks up the asynchronous process of staging a file from a slow storage system to a cache location for subsequent retrieval.

Instead of copying files around and doing filesystem logic, the stores, caches, and the files in them are just records in ActiveRecord tables. When "staging" a file, a sleepy method is invoked that takes it's time updating a file's status and eventually returning the download URL.
  
So that this long-running method is non-blocking to the client, the method is invoked using the [Delayed Jobs](https://github.com/collectiveidea/delayed_job) gem, which queues up a job to run the method while control is returned to controller and back to the client. Delayed Job is database backed (vs. Redis, etc.), but it does require a process to be running to run scheduled jobs.

From the client's point of view, the process is simple:

1. Use the API to get status of a file in the cache
1. Use the API to POST a job to stage a file
1. Use the API to keep getting the status of the file
1. Use the API to get the download URL once the "staging" is complete 

## Installation

Do normal stuff to deploy

    bundle install
    rake db:migrate

The stores, caches, and files have been mocked up in ActiveRecord, so seed the database

    rake db:seed

The process of "staging" a file to the cache is mocked up as a delayed job, so run the job queue manager

    ./bin/delayed_job start

Start the server

    rails s

## Storage Proxy API
    GET  /storage_api/stores
    GET  /storage_api/stores/:store_name
    GET  /storage_api/stores/:store_name/media_files
    GET  /storage_api/stores/:store_name/media_files/:media_file_name
    
    POST /storage_api/jobs/:cache_name/:cache_file_name  (type=stage|fixity)
    
    GET  /storage_api/caches
    GET  /storage_api/caches/:cache_name
    GET  /storage_api/caches/:cache_name/cache_files
    GET  /storage_api/caches/:cache_name/cache_files/:cache_file_name

## Examples

List files in the store called 'SDA'

    http://localhost:3000/storage_api/stores/SDA/media_files

Get detail for a named file in the store 'SDA'

    http://localhost:3000/storage_api/stores/SDA/media_files/MDPI_40000000054496_01_access.mp4

List files and their status in the cache called 'SDADisk'

    http://localhost:3000/storage_api/caches/SDADisk/cache_files/

Get status and detail for a named file in the cache called 'SDADisk'

    http://localhost:3000/storage_api/caches/SDADisk/cache_files/MDPI_40000000054496_01_access.mp4

Post a job to mimic staging of file in the store to the cache, then view changed status

    curl -X POST http://localhost:3000/storage_api/jobs/SDADisk/MDPI_40000000054496_01_access.mp4 -d "type=stage"
    http://localhost:3000/storage_api/caches/SDADisk/cache_files/MDPI_40000000054496_01_access.mp4
