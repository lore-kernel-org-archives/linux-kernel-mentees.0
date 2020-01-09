Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA93C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 16:45:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673FE20721
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 16:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LEfEndcf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673FE20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3993220337;
	Thu,  9 Jan 2020 16:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJuGk3gd+jb5; Thu,  9 Jan 2020 16:45:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CAA4B20380;
	Thu,  9 Jan 2020 16:45:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9D59C18DC;
	Thu,  9 Jan 2020 16:45:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFA59C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D1937861FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oyy9sd90_bNL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:45:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 88562861FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 16:45:36 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id p8so6189214iln.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mgUkliqRjYephC1fZxkSkRThvgALipgO7teYXLOjmF0=;
 b=LEfEndcfvFV/4vYDEZ7KdR5HVxCC7zzcdcfqYqvVPXp7ufAfmrqIUjDjaIivZnqbzh
 kqyueJZPyJ6zB6IXktRNw9gZEeR8gSz6B+QF/kiSrx/wyPGVpeEcwhIW2xFkQ0li9OTJ
 45cux5kSc0xiIUmq2HsVZ8jp4nX2MdVkM1d2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgUkliqRjYephC1fZxkSkRThvgALipgO7teYXLOjmF0=;
 b=COF+c+Hiwcet9zul0osvHTL+nf2NcDSpC3omMKsF1SccFSRkxkmTUx2tN/CEjkeGxM
 UvH9wmIIpBbRFMHNsIevoXzyIXIdkPAyjRuozLhQLhrrr30gwANOz1cPkRmU6eRVjftA
 K0I5ZaQKet5YEtfZtiHmQCfyr4NR+47x9hLv+qLCrksPRTtspAbP4RklO68d6dwchkku
 NkIuptbYWx1BENriJF8thFcM8hL+ntPd5m4OaTHgdH37II1AxUNsFMW1ms1txRndk0zX
 w3QI0C7WNjGZK6Rks8bN7cTBltCXuXE9sGQYL08ImXUaEWm1zNFTCcAI8ORGYi5lRacR
 +bSg==
X-Gm-Message-State: APjAAAXCJDMaxlARVhBKiN8jfzl0YULY1ItJfY5cdZV+W4dN8IvfQ8Ce
 3MoDeMJEQIBJCT8zBu0Ix8y2DKGk
X-Google-Smtp-Source: APXvYqwzVfA5MBFMt0SWUBI/tcL1ej/S3fQvdEVwMfGmh99D7ReHBeglLNRTklwDug74bgAFk3MtFA==
X-Received: by 2002:a92:8d8e:: with SMTP id w14mr9420149ill.187.1578588335706; 
 Thu, 09 Jan 2020 08:45:35 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id e7sm1539826iot.71.2020.01.09.08.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 08:45:35 -0800 (PST)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org,
 sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5f296977-6aac-cfd9-9082-ff824f85ab43@linuxfoundation.org>
Date: Thu, 9 Jan 2020 09:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109152408.919325-2-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/1] media: dvb_dummy_tuner:
	implement driver skeleton
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Daniel,

On 1/9/20 8:24 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Implement the skeleton for the tuner driver in a separate file.

Please add more detail here on what this driver does. What this
driver is used for and so on.

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>   drivers/media/tuners/Kconfig           |   7 ++
>   drivers/media/tuners/Makefile          |   1 +
>   drivers/media/tuners/dvb_dummy_tuner.c | 153 +++++++++++++++++++++++++
>   drivers/media/tuners/dvb_dummy_tuner.h |  20 ++++
>   4 files changed, 181 insertions(+)
>   create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c
>   create mode 100644 drivers/media/tuners/dvb_dummy_tuner.h
> 
> diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
> index e104bb7766e1..efa1591fe0ae 100644
> --- a/drivers/media/tuners/Kconfig
> +++ b/drivers/media/tuners/Kconfig
> @@ -296,4 +296,11 @@ config MEDIA_TUNER_QM1D1B0004
>   	default m if !MEDIA_SUBDRV_AUTOSELECT
>   	help
>   	  Sharp QM1D1B0004 ISDB-S tuner driver.
> +
> +config MEDIA_TUNER_DVB_DUMMY_TUNER
> +	tristate "Dummy tuner"
> +	depends on MEDIA_SUPPORT && I2C
> +	default m if !MEDIA_SUBDRV_AUTOSELECT
> +	help
> +	  Dummy tuner driver for common TV standards.

Samehere. Give more details on what this driver does. Add enough detail
to help users decide why they should enable it or not.

>   endmenu
> diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
> index 7b4f8423501e..f98de1cf2e19 100644
> --- a/drivers/media/tuners/Makefile
> +++ b/drivers/media/tuners/Makefile
> @@ -44,5 +44,6 @@ obj-$(CONFIG_MEDIA_TUNER_QM1D1C0042) += qm1d1c0042.o
>   obj-$(CONFIG_MEDIA_TUNER_QM1D1B0004) += qm1d1b0004.o
>   obj-$(CONFIG_MEDIA_TUNER_M88RS6000T) += m88rs6000t.o
>   obj-$(CONFIG_MEDIA_TUNER_TDA18250) += tda18250.o
> +obj-$(CONFIG_MEDIA_TUNER_DVB_DUMMY_TUNER) += dvb_dummy_tuner.o
>   
>   ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
> diff --git a/drivers/media/tuners/dvb_dummy_tuner.c b/drivers/media/tuners/dvb_dummy_tuner.c
> new file mode 100644
> index 000000000000..63d2e47d4739
> --- /dev/null
> +++ b/drivers/media/tuners/dvb_dummy_tuner.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Driver for Dummy Frontend
> + *
> + *  Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>

General practice is the following.

Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

> + */
> +
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +#include "dvb_dummy_tuner.h"
> +
> +struct dvb_dummy_tuner_dev {
> +	struct dvb_frontend *fe;
> +};
> +
> +static void dvb_dummy_tuner_release(struct dvb_frontend *fe)
> +{
> +}
> +
> +static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe, void *priv_cfg)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
> +					 u32 *frequency)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
> +					 u32 *bandwidth)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
> +					    u32 *frequency)
> +{
> +	return 0;
> +}
> +
> +static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
> +{
> +	return 0;
> +}
> +
> +static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
> +	.release = dvb_dummy_tuner_release,
> +	.init = dvb_dummy_tuner_init,
> +	.sleep = dvb_dummy_tuner_sleep,
> +	.suspend = dvb_dummy_tuner_suspend,
> +	.resume = dvb_dummy_tuner_resume,
> +	.set_params = dvb_dummy_tuner_set_params,
> +	.set_config = dvb_dummy_tuner_set_config,
> +	.get_bandwidth = dvb_dummy_tuner_get_bandwidth,
> +	.get_frequency = dvb_dummy_tuner_get_frequency,
> +	.get_if_frequency = dvb_dummy_tuner_get_if_frequency,
> +	.get_status = dvb_dummy_tuner_get_status,
> +};
> +
> +static const struct i2c_device_id dvb_dummy_tuner_i2c_id_table[] = {
> +	{"dvb_dummy_tuner", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dvb_dummy_tuner_i2c_id_table);
> +
> +static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
> +				     const struct i2c_device_id *id)
> +{
> +	int ret = 0;
> +	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
> +	struct dvb_frontend *fe = config->fe;
> +	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
> +
> +	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
> +	if (!tuner_dev) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	i2c_set_clientdata(client, tuner_dev);
> +	tuner_dev->fe = config->fe;
> +
> +	memcpy(&fe->ops.tuner_ops,
> +	       &dvb_dummy_tuner_ops,
> +	       sizeof(struct dvb_tuner_ops));
> +
> +	fe->tuner_priv = client;
> +
> +	pr_debug("%s: Successfully probed %s\n", __func__, client->name);
> +	return ret;
> +
> +err:
> +	pr_err("%s: failed\n", __func__);
> +	return ret;
> +}
> +
> +static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
> +{
> +	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
> +	struct dvb_frontend *fe = tuner_dev->fe;
> +
> +	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
> +	fe->tuner_priv = NULL;
> +	kfree(tuner_dev);
> +
> +	return 0;
> +}
> +
> +static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
> +	.driver = {
> +		.name = "dvb_dummy_tuner",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe		= dvb_dummy_tuner_i2c_probe,
> +	.remove		= dvb_dummy_tuner_i2c_remove,
> +	.id_table	= dvb_dummy_tuner_i2c_id_table,
> +};
> +module_i2c_driver(dvb_dummy_tuner_i2c_driver);
> +
> +MODULE_DESCRIPTION("DVB Dummy Tuner");
> +MODULE_AUTHOR("Daniel W. S. Almeida");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/tuners/dvb_dummy_tuner.h b/drivers/media/tuners/dvb_dummy_tuner.h
> new file mode 100644
> index 000000000000..fde7628258fa
> --- /dev/null
> +++ b/drivers/media/tuners/dvb_dummy_tuner.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * DVB Dummy Tuner
> + *

Please add details about the driver similar to the .c file.

> + */
> +#ifndef __TUNER_DVB_DUMMY_TUNER_H__
> +#define __TUNER_DVB_DUMMY_TUNER_H__
> +
> +#include <media/dvb_frontend.h>
> +/**
> + * struct dvb_dummy_tuner_config - configuration parameters for the dummy tuner
> + *
> + * @fe:
> + *	frontend returned by driver
> + */
> +struct dvb_dummy_tuner_config {
> +	struct dvb_frontend *fe;
> +};
> +
> +#endif /*__TUNER_DVB_DUMMY_TUNER_H__ */
> 


Looks like there is more code to be added to register/unregister

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
