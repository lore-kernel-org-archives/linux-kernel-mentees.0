Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530F6EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Jul 2023 07:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 837B8408CB;
	Wed, 19 Jul 2023 07:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 837B8408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_TWoBlUdz1u; Wed, 19 Jul 2023 07:40:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 597DE40576;
	Wed, 19 Jul 2023 07:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 597DE40576
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 182C7C0072;
	Wed, 19 Jul 2023 07:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18612C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 07:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D94E560B1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 07:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D94E560B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwyO2xI2efiM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 07:39:55 +0000 (UTC)
X-Greylist: delayed 340 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Jul 2023 07:39:55 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC1C60B10
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BC1C60B10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Jul 2023 07:39:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 619EC612F0;
 Wed, 19 Jul 2023 07:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3D7C433C8;
 Wed, 19 Jul 2023 07:34:11 +0000 (UTC)
Message-ID: <81c898ca-cf43-d6b8-8686-a274c7adf3be@xs4all.nl>
Date: Wed, 19 Jul 2023 09:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Initialization of read buffer for dib3000_read_reg
Content-Language: en-US
To: Kernel-Development <kdev@benbenng.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>
References: <20230413091841.22000-1-kdev@benbenng.net>
 <0100018779eb40dc-cee9e39d-5d87-4733-83db-eca5218fcc8f-000000@email.amazonses.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <0100018779eb40dc-cee9e39d-5d87-4733-83db-eca5218fcc8f-000000@email.amazonses.com>
Cc: "syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com"
 <syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

Some comments on this patch:

On 13/04/2023 11:21, Kernel-Development wrote:
> This is a patch that fixes a bug:
> KMSAN: uninit-value in dib3000mb_attach (2)
> 
> Local variable u8 rb[2] is not initialized as it is used as read buffer
> for i2c_transfer(). It is expected that i2c_transfer() should fill in
> the buffer before the target function returns rb's content. However
> error handling of i2c_transfer is not done, and on occasions where the
> read fails, uninitialized rb value will be returned.
> 
> The usage of this function, defined as macro rd() in
> drivers/media/dvb-frontends/dib3000mb_priv,h, does not expect any error
> to occur. Adding error handling here might involve significant code
> changes.
> 
> Thus 0-initialization is done on rb. This might affect some logic on
> error case as the use of the return value is used as boolean and flags.
> 
> Reported-by: syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=2f4d19de8c9e9f0b9794e53ca54d68e0ffe9f068
> Signed-off-by: (Ben) HokChun Ng <kdev@benbenng.net>
> ---
>  drivers/media/dvb-frontends/dib3000mb.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dib3000mb.c b/drivers/media/dvb-frontends/dib3000mb.c
> index a6c2fc4586eb..0dd96656aaf4 100644
> --- a/drivers/media/dvb-frontends/dib3000mb.c
> +++ b/drivers/media/dvb-frontends/dib3000mb.c
> @@ -50,15 +50,19 @@ MODULE_PARM_DESC(debug, "set debugging level (1=info,2=xfer,4=setfe,8=getfe (|-a
>  
>  static int dib3000_read_reg(struct dib3000_state *state, u16 reg)
>  {
> +	int errno;
>  	u8 wb[] = { ((reg >> 8) | 0x80) & 0xff, reg & 0xff };
> -	u8 rb[2];
> +	u8 rb[2] = { 0, 0 };

Really all you need to do here is zero this array, which can be even
shorter by writing: u8 rb[2] = {};

It is enough to just show the "i2c read error" message, nothing else
is needed here.

BTW, checkpatch.pl also complains about your email address ('Kernel-Development <kdev@benbenng.net>'
being different from your SoB line: (Ben) HokChun Ng <kdev@benbenng.net>.

It's a good idea to ensure the two are the same. I would stick to
(Ben) HokChun Ng <kdev@benbenng.net> since that has your actual name.

Regards,

	Hans

>  	struct i2c_msg msg[] = {
>  		{ .addr = state->config.demod_address, .flags = 0,        .buf = wb, .len = 2 },
>  		{ .addr = state->config.demod_address, .flags = I2C_M_RD, .buf = rb, .len = 2 },
>  	};
>  
> -	if (i2c_transfer(state->i2c, msg, 2) != 2)
> -		deb_i2c("i2c read error\n");
> +	errno = i2c_transfer(state->i2c, msg, 2);
> +	if (errno != 2) {
> +		deb_i2c("i2c read error (errno: %d)\n", -errno);
> +		return 0;
> +	}
>  
>  	deb_i2c("reading i2c bus (reg: %5d 0x%04x, val: %5d 0x%04x)\n",reg,reg,
>  			(rb[0] << 8) | rb[1],(rb[0] << 8) | rb[1]);

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
