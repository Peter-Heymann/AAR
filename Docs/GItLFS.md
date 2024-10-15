# Server-Files
## Information

One file of the update is lager than 100MB so we need Git LFS (Git Large File Storage).

**Install Git Large Files**

````bash
git lfs install
````

**Track File**
````bash
cd <PATH_TO_REPOSITORY>
git lfs track "<FILENAME>"
````

A `.gitattributes` File will be created

**To Push the large file**
````bash
git lfs push --all origin main
````

Now just commit and push the rest of the files.

**For Help**

For manual installation:

[Git Large File Storage](https://git-lfs.com/) <br/>
[GitHub Documentation](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github) <br/>
[Good YouTube Tutorial](https://www.youtube.com/watch?v=9HCsSD5PMSk&ab_channel=GeoDev)<br/>