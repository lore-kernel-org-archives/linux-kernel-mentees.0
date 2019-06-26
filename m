From: gregkh at linuxfoundation.org (Greg KH)
Date: Wed, 26 Jun 2019 09:54:50 +0800
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8723bs: replace
 symbolic permission with octal permission
In-Reply-To: <20190624135654.6092-1-sushmaunnibhavi425@gmail.com>
References: <20190624135654.6092-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190626015450.GB30966@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jun 24, 2019 at 07:26:54PM +0530, Sushma Unnibhavi wrote:
> Resolved following checkpatch issue:
> WARNING: symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> 
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> index 5f950fda48ea..701ea9e76141 100644
> --- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> +++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> @@ -21,7 +21,7 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
>  {
>  	struct proc_dir_entry *entry;
>  
> -	entry = proc_mkdir_data(name, S_IRUGO|S_IXUGO, parent, data);
> +	entry = proc_mkdir_data(name, 0444|0111, parent, data);

So, 0555 would be the correct value here, right?  :)

Also, why are you only fixing this one warning in this file?  There
should be at least one more instance of this issue here.

And, as a meta-comment, this whole function should be removed, as it is
not needed.  And in reality, the whole proc file additions that this
driver adds should be removed as they are pointless (no need for the
version, and the debugging flag should be removed entirely and the
in-kernel debugging functions used instead.)

So, you have lots of options for how to resolve this issue,

thanks,

greg k-h
