Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A35C33CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:54:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D32D2072E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 15:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChgxqELA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D32D2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A04C8650E;
	Thu,  9 Jan 2020 15:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDnU6V4ns0UG; Thu,  9 Jan 2020 15:54:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A718184237;
	Thu,  9 Jan 2020 15:54:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0E56C1796;
	Thu,  9 Jan 2020 15:54:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE2DC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 421C386661
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnciahHcrMZ8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:54:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9B0B78650E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 15:54:39 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA078206ED;
 Thu,  9 Jan 2020 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578585279;
 bh=CO2oAXeI60Yqe46XfH5899cbMwfHKmsfrdFWFp4IkwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ChgxqELAE5vIbirpB/5834tX0zLmq/6Qkuwk3PhP6YsOSsJDsGlEhIyTXox1JsuJN
 B1OIZI0Cw440zjgdeGT0HZFi52lZIWWtxsYhHreFRGpfMlj3sPcQYGOOAw2rt9a52Q
 sqj3ztbeMWxnUDTLUqyEnMlliuBSWr8muk4dTo5Y=
Date: Thu, 9 Jan 2020 16:54:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200109155437.GA568342@kroah.com>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109152408.919325-2-dwlsalmeida@gmail.com>
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Jan 09, 2020 at 12:24:08PM -0300, Daniel W. S. Almeida wrote:
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

As you are a driver, you should never need to call any pr_* calls,
instead use dev_*().  For this, you can use dev_dbg(), but really, why
is that even needed except for your debugging bringup.  And for that,
you can use ftrace, right?  So no need for any printing of anything
here.

> +	return ret;
> +
> +err:
> +	pr_err("%s: failed\n", __func__);

Again, dev_err() would be proper, but there's no need for any error
message here.


Don't you need to register the tuner ops with something in this
function?

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

Don't you need to unregister the tuner ops in here?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
