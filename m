Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C62C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:56:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3508E20833
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:56:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UFVSeqs0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3508E20833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E685188DB2;
	Sun,  1 Dec 2019 07:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8Bni-zW6wrv; Sun,  1 Dec 2019 07:56:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49FA988DA4;
	Sun,  1 Dec 2019 07:56:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30D1EC1DD9;
	Sun,  1 Dec 2019 07:56:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94999C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 841AD88DA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnVxqJpZUfdy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:56:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E0F1788DB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCu+GZh/MV35W7L3MvP8XVnpQ9u3c3lBDXh/NgS/ZZ4=; b=UFVSeqs0QVBd6/YDWWgFvrIhW
 etzfcOGzRcrKE4aWsoIP0T/568k2N9SnEcWrK6YjA3h0vcMqI2OH4km++sublrGJllXYxybJ7OKT3
 9aZXrwmc7Z9NcfcpgwSBEHUHjH02eYd756h6g6we7eb4GlMNB8Ygznleqk+vdTRiAIJ2IjJ90s8PW
 3UsNEx5+07t/C5ttpHN4zPMcd9FAy0myxp60SW6TyRPdhuJDEBX06iIAOEEORBUbmpavg411hN8aP
 1IrCOgMp4g71p3Y5JT8V1++OemNpuGstXLuaGtLXoqUxgAJEiMbZ1Otxz21EGxq29BxbkgnF7o5o0
 TnIL7FkEw==;
Received: from [80.156.29.194] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibK5O-0004nk-8Z; Sun, 01 Dec 2019 07:56:06 +0000
Date: Sun, 1 Dec 2019 08:56:02 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191201085602.7212436b@kernel.org>
In-Reply-To: <20191126153157.26355-1-dwlsalmeida@gmail.com>
References: <20191126153157.26355-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: dummy_dvb_fe: register
	adapter/frontend
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

Em Tue, 26 Nov 2019 12:31:57 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Before using the DTV frontend core, a bridge driver should register the
> new frontend at the subsystem and unregister it at device detach / removal.

This patch is conceptually wrong. The dummy_dvb_fe is a frontend driver.

As such, it doesn't register itself as a bridge. What we need here is a
separate virtual DVB bridge driver with would register itself as a DVB
adapter and use the dummy_dvb_fe as its frontend.

Regards,
Mauro

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 39 ++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 4db679cb70ad..1ccb58c67e8e 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -13,12 +13,12 @@
>  #include <media/dvb_frontend.h>
>  #include "dvb_dummy_fe.h"
>  
> +DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  
>  struct dvb_dummy_fe_state {
>  	struct dvb_frontend frontend;
>  };
>  
> -
>  static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  				    enum fe_status *status)
>  {
> @@ -84,7 +84,36 @@ static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
>  
>  static int dvb_dummy_fe_init(struct dvb_frontend* fe)
>  {
> -	return 0;
> +	int result = 0;
> +	struct dvb_adapter *adapter = fe->dvb;
> +
> +	result = dvb_register_adapter(adapter,
> +				      KBUILD_MODNAME,
> +				      THIS_MODULE,
> +				      adapter->device,
> +				      adapter_nr);
> +
> +	if (!result) {
> +		pr_err("DVB_DUMMY_FE: Failed to register the adapter, errno:%d",
> +			result);
> +		goto err;
> +	}
> +
> +	result = dvb_register_frontend(adapter, fe);
> +	if (!result) {
> +		pr_err("DVB_DUMMY_FE: Failed to register the frontend, errno:%d",
> +			result);
> +		goto err;
> +	}
> +
> +	return result;
> +
> +err:
> +	dvb_unregister_adapter(adapter);
> +	dvb_unregister_frontend(fe);
> +	dvb_frontend_detach(fe);
> +	return result;
> +
>  }
>  
>  static int dvb_dummy_fe_set_tone(struct dvb_frontend *fe,
> @@ -102,6 +131,12 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
>  static void dvb_dummy_fe_release(struct dvb_frontend* fe)
>  {
>  	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> +	struct dvb_adapter *adapter = fe->dvb;
> +
> +	dvb_unregister_adapter(adapter);
> +	dvb_unregister_frontend(fe);
> +	dvb_frontend_detach(fe);
> +
>  	kfree(state);
>  }
>  



Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
