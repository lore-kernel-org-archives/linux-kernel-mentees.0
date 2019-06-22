From: gregkh at linuxfoundation.org (Greg KH)
Date: Sat, 22 Jun 2019 09:38:37 +0200
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8723bs: change
	sscanf to kstrtoint
In-Reply-To: <20190622073158.6712-1-hvubfoss@gmail.com>
References: <20190622073158.6712-1-hvubfoss@gmail.com>
Message-ID: <20190622073837.GB10516@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat, Jun 22, 2019 at 01:01:58PM +0530, Harshavardhan Unnibhavi wrote:
> Fixes following checkpath.pl warning:
> Prefer kstrto<type> to single variable sscanf
> 
> Signed-off-by: Harshavardhan Unnibhavi <hvubfoss at gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> index 5f950fda48ea..b700363c899c 100644
> --- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> +++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> @@ -468,7 +468,7 @@ ssize_t proc_set_odm_dbg_comp(struct file *file, const char __user *buffer, size
>  
>  	if (buffer && !copy_from_user(tmp, buffer, sizeof(tmp))) {
>  
> -		int num = sscanf(tmp, "%llx", &dbg_comp);
> +		int num = kstrtoint(tmp, "%llx", &dbg_comp);

If the conversion was this easy, we would have done it with a global
search/replace a long time ago :)

Are you _sure_ this is correct?

thanks,

greg k-h
