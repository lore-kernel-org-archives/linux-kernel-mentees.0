From: skhan@linuxfoundation.org (Shuah Khan)
Date: Wed, 26 Jun 2019 18:46:58 -0600
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH]
 Documentation : fs : Convert xfs.txt to xfs.rst
In-Reply-To: <20190627003447.23397-1-sheriffesseson@gmail.com>
References: <20190627003447.23397-1-sheriffesseson@gmail.com>
Message-ID: <2b26d1a2-7c93-2eff-31ed-6a97d7dd47df@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627004658.IUw8OloG61JlsPw0hOsS4LamutmO0aVmCZ3yjg0eqGI@z>

On 6/26/19 6:34 PM, Sheriff Esseson wrote:
> - Convert xfs.txt to a ReST file for compatibility with doc-tools.
> 
> - Rename xfs.txt with xfs.rst accordingly.
> 

Please write full sentences as opposed to bullet point in your
change log. Please check a few change logs by running git log
in the repo.

> Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
> ---
>   .../filesystems/{xfs.txt => xfs.rst}          | 146 +++++++++---------
>   Documentation/scsi/{scsi.txt => scsi.rst}     |  37 +++--
>   2 files changed, 93 insertions(+), 90 deletions(-)
>   rename Documentation/filesystems/{xfs.txt => xfs.rst} (82%)
>   rename Documentation/scsi/{scsi.txt => scsi.rst} (72%)

You probably didn't reset the changes to scsi.txt, assuming this
patch is for converting xfs.txt

Assuming this compiles and generates good document, make sure to
cc mailing lists. Check the resulting pdf and html after compiling
to make sure it reads well.

thanks,
-- Shuah
