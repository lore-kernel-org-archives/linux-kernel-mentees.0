From: skhan@linuxfoundation.org (Shuah Khan)
Date: Mon, 23 Sep 2019 15:59:55 -0600
Subject: [Linux-kernel-mentees] Fwd: [PATCH] fs: direct-io: Fixed a
	Documentation build warn
In-Reply-To: <CAF65HP0CViR_Dw=xEhSAY++o=UUxtDAv2ZkAHjVkmOMiNTEeBA@mail.gmail.com>
References: <20190923123701.GA9627@madhuparna-HP-Notebook>
	<CAF65HP3W3OM-Euc28fpZc_EPcG9KzEt8==UOC0fgS8ODoWRXiA@mail.gmail.com>
	<CAF65HP0CViR_Dw=xEhSAY++o=UUxtDAv2ZkAHjVkmOMiNTEeBA@mail.gmail.com>
Message-ID: <c811c429-3ad5-8601-318a-850a26a46531@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190923215955.emIb0wDCfZ9xl62NOtWDIOtFXV2hk9leomAwwE1O1_Q@z>

On 9/23/19 3:03 PM, Madhuparna Bhowmik wrote:
> Fixed Excess function parameters warning.
> warning: Excess function parameter 'offset' description in
> 'dio_complete'.
> Removed the description of the local variable offset from the
> description for arguments of a function and added it with the
> declaration of the variable.

Change the commit log to say: Fixes instead of Fixed and Removes
instead of Removed.

Also I think what you mean to say is that the this patch removes
offset which isn't an argument to the function from the function
header. Can you rephrase the commit log.

> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com 
> <mailto:madhuparnabhowmik04 at gmail.com>>

Why is this a Fwd::

> ---
>  ?fs/direct-io.c | 2 +-
>  ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/direct-io.c b/fs/direct-io.c
> index ae196784f487..a9cb770f0bc1 100644
> --- a/fs/direct-io.c
> +++ b/fs/direct-io.c
> @@ -243,7 +243,6 @@ void dio_warn_stale_pagecache(struct file *filp)
> 
>  ?/**
>  ? * dio_complete() - called when all DIO BIO I/O has been completed
> - * @offset: the byte offset in the file of the completed operation
>  ? *
>  ? * This drops i_dio_count, lets interested parties know that a DIO 
> operation
>  ? * has completed, and calculates the resulting return code for the 
> operation.
> @@ -255,6 +254,7 @@ void dio_warn_stale_pagecache(struct file *filp)
>  ? */
>  ?static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int 
> flags)
>  ?{
> +? ? ? ?/* offset: the byte offset in the file of the completed operation */
>  ? ? ? ? loff_t offset = dio->iocb->ki_pos;
>  ? ? ? ? ssize_t transferred = 0;
>  ? ? ? ? int err;
> -- 
> 2.17.1
> 
> ?
> ?

thanks,
-- Shuah
