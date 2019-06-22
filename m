From: gregkh@linuxfoundation.org (Greg KH)
Date: Sat, 22 Jun 2019 07:34:15 +0200
Subject: [Linux-kernel-mentees] [PATCH] staging: rtl8723bs: replace
 symbolic permission with octal permission
In-Reply-To: <20190621170735.30373-1-sushmaunnibhavi425@gmail.com>
References: <20190621170735.30373-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190622053415.GA16793@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190622053415.TR08cR8oGlppPBLoZNycVdYF6ZKu3tF4oI-pPHy51LE@z>

On Fri, Jun 21, 2019 at 10:37:35PM +0530, Sushma Unnibhavi wrote:
> Resolved following checkpatch issue:
> WARNING: symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> 
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> index 5f950fda48ea..fd9dfb953ada 100644
> --- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> +++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
> @@ -21,7 +21,7 @@ inline struct proc_dir_entry *rtw_proc_create_dir(const char *name, struct proc_
>  {
>  	struct proc_dir_entry *entry;
>  
> -	entry = proc_mkdir_data(name, S_IRUGO|S_IXUGO, parent, data);
> +	entry = proc_mkdir_data(name, 0444|S_IXUGO, parent, data);

Don't mix/match these, either use symbolic permissions or octal
permissions, never both :)

thanks,

greg k-h
