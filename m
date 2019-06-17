From: skhan at linuxfoundation.org (Shuah Khan)
Date: Mon, 17 Jun 2019 09:56:36 -0600
Subject: [Linux-kernel-mentees] [PATCH] media: pci: cx88: Change the
	type of 'missed' to u64
In-Reply-To: <20190616153613.14259-1-puranjay12@gmail.com>
References: <20190616153613.14259-1-puranjay12@gmail.com>
Message-ID: <7b60f07d-0609-1153-e07b-13662fc60787@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/16/19 9:36 AM, Puranjay Mohan wrote:
> Callers of hrtimer_forward_now() should save the return value in u64.
> change type of missed from unsigned long to u64.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>   drivers/media/pci/cx88/cx88-input.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
> index 27f690b54e0c..fa5ce464b0ba 100644
> --- a/drivers/media/pci/cx88/cx88-input.c
> +++ b/drivers/media/pci/cx88/cx88-input.c
> @@ -167,7 +167,7 @@ static void cx88_ir_handle_key(struct cx88_IR *ir)
>   
>   static enum hrtimer_restart cx88_ir_work(struct hrtimer *timer)
>   {
> -	unsigned long missed;
> +	u64 missed;
>   	struct cx88_IR *ir = container_of(timer, struct cx88_IR, timer);
>   
>   	cx88_ir_handle_key(ir);
> 

You are missing the mailing lists! Please include all get_maintainers.pl
suggests on all your patches.

thanks,
-- Shuah
