Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9A4C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 04:57:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B6721774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 04:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svm8uAIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B6721774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F6A486221;
	Mon,  2 Dec 2019 04:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xjmuJk3t9yV; Mon,  2 Dec 2019 04:57:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8DA8886135;
	Mon,  2 Dec 2019 04:57:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CBF2C1DDC;
	Mon,  2 Dec 2019 04:57:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8E1AC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 04:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C6FEF86221
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 04:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOPV-GEbvqrM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 04:57:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 031AD86135
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 04:57:27 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q28so12391008qkn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 20:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=L7WS1CVEFmUkUbjFJRQuqrhJYc6sOYye0ob5XPBNx6o=;
 b=svm8uAIUbg/A42Es39u6WSuFOkk6/v8d26swg4/QqPMfr+/TzEWsCqNHEDKjBhbgEY
 9Af5ByMo0BOTyePGsyeuIceGrPDGTA5WqS04pZZ4TdM8lfIyM6cZDzhm2eLLYXYNrvik
 vN/HdUDzxAIlO7PCaf/4RCGYNdKWcA5gmTSNnpjyC5wnSU6plNMlJf4Tbu1PXUooxlNN
 QRvUtBiUy5Yq044ofYhHLVV4gXo2hTf6acOX+xOKi4nDiexmZRONqSSDH7R/nwqv2BEI
 vCwmRg41nezVFAXWzL2vEiAZU3+BCzv/QIwN1DRlgcHfMsHc+cG1UuG3htzeUZpqJ+uq
 p+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=L7WS1CVEFmUkUbjFJRQuqrhJYc6sOYye0ob5XPBNx6o=;
 b=MHmiEQ5MfgdQc9UXv08jx8NRTy6XZkzmLkwMZEbs/5/o1tLt3JtoBR52q8WJh5bFW4
 lBjeCw1Ct/pP+7rFORkS4B2+u3HDlHDTQi+jjfwst3QzgR9OlJWdqQyn1RoQ2VsAbdiD
 yBbNgwggZh+k0XOnjXKbUDwdW4OCeSsrMBcnwwU4B9ac/a7Dm4k2FI1aJStViICqOEBT
 0xIv3X6kcZazvTFfXZou7auiUse4WjVy/PUjXeAysfVzprWubzlCsmA3GBF8sTrmOUWC
 hVBg9VAUYOZVqF8JO4SU32CcMn94eRw6nbqnzMDly3osAMKEixtyAZ8Wy7jrqj66AUYL
 JOeA==
X-Gm-Message-State: APjAAAWN9HMbll7+CsGt7nRrHzCnRo8+gtRSGuvyft8pqAe1KHuw0xWw
 N9AewODyQIQY6x0TNEWI6ic=
X-Google-Smtp-Source: APXvYqzvxpz6haPc0z9tQr+S7/W3R7b6b5+CwE/WzcHTMr4jQE1kpa8NwHFtuxfs7gGmAjzUmYeJmQ==
X-Received: by 2002:ae9:ef06:: with SMTP id d6mr30137632qkg.402.1575262646899; 
 Sun, 01 Dec 2019 20:57:26 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 139sm7666047qkj.116.2019.12.01.20.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 20:57:26 -0800 (PST)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20191130045420.111288-1-dwlsalmeida@gmail.com>
 <20191201090733.2bd8c2c4@kernel.org>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <13629649-f363-4787-e88b-784f8309bfcd@gmail.com>
Date: Mon, 2 Dec 2019 01:49:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191201090733.2bd8c2c4@kernel.org>
Content-Language: en-US
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe.c: add
	members to dvb_dummy_fe_state
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
Content-Type: multipart/mixed; boundary="===============0911251089499186665=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============0911251089499186665==
Content-Type: multipart/alternative;
 boundary="------------AFFBA7020806D6E7AADC6BB7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AFFBA7020806D6E7AADC6BB7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mauro, thanks for checking out my work!

> please don't add fields at the
> struct while they're not used, as this makes harder for reviewers to be
> sure that we're not adding bloatware at the code.

OK.

> Please remember that
> we want one logical change per patch.
>
> It means that, if you add a state->frontend_status at the driver, the
> patch should implement the entire logic for it.
I will keep this in mind.

>   static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
>   {
> +
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	state->sleeping = true;
> +

> Hmm...what's the sense of adding it? Where are you setting it to false?
> Where are you using the sleeping state?

I noted some drivers seem to instruct the hardware into a low power state. Take helene, for instance:

static int helene_sleep(struct dvb_frontend *fe)
{
	struct helene_priv *priv = fe->tuner_priv;

	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
	helene_enter_power_save(priv);
	return 0;
}

static int helene_enter_power_save(struct helene_priv *priv)
{
	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
	if (priv->state == STATE_SLEEP)
		return 0;

	/* Standby setting for CPU */
	helene_write_reg(priv, 0x88, 0x0);

	/* Standby setting for internal logic block */
	helene_write_reg(priv, 0x87, 0xC0);

	priv->state = STATE_SLEEP;
	return 0;
}

As we are emulating some piece of hardware I thought it would be enough to add a simple bool to indicate that the device was sleeping.

This patch was a bit convoluted on my part. Let's iron out the issues you pointed out in v2.

- Daniel.


--------------AFFBA7020806D6E7AADC6BB7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Hi Mauro, thanks for checking out my work!

<blockquote type="cite"><pre class="moz-quote-pre" wrap="">please don't add fields at the
struct while they're not used, as this makes harder for reviewers to be
sure that we're not adding bloatware at the code.</pre>
</blockquote>
OK.

<blockquote type="cite"><pre class="moz-quote-pre" wrap="">Please remember that
we want one logical change per patch.

It means that, if you add a state-&gt;frontend_status at the driver, the
patch should implement the entire logic for it.</pre>
</blockquote>I will keep this in mind.

<blockquote type="cite"><pre class="moz-quote-pre" wrap=""> static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
 {
+
+	struct dvb_dummy_fe_state *state = fe-&gt;demodulator_priv;
+
+	state-&gt;sleeping = true;
+</pre></blockquote>
<blockquote type="cite"><pre class="moz-quote-pre" wrap="">Hmm...what's the sense of adding it? Where are you setting it to false?
Where are you using the sleeping state?
</pre>
</blockquote>
I noted some drivers seem to instruct the hardware into a low power state. Take helene, for instance:

static int helene_sleep(struct dvb_frontend *fe)
{
	struct helene_priv *priv = fe-&gt;tuner_priv;

	dev_dbg(&amp;priv-&gt;i2c-&gt;dev, "%s()\n", __func__);
	helene_enter_power_save(priv);
	return 0;
}
<style type="text/css">p, li { white-space: pre-wrap; }
</style>
static int helene_enter_power_save(struct helene_priv *priv)
{
	dev_dbg(&amp;priv-&gt;i2c-&gt;dev, "%s()\n", __func__);
	if (priv-&gt;state == STATE_SLEEP)
		return 0;

	/* Standby setting for CPU */
	helene_write_reg(priv, 0x88, 0x0);

	/* Standby setting for internal logic block */
	helene_write_reg(priv, 0x87, 0xC0);

	priv-&gt;state = STATE_SLEEP;
	return 0;
}

As we are emulating some piece of hardware I thought it would be enough to add a simple bool to indicate that the device was sleeping.

This patch was a bit convoluted on my part. Let's iron out the issues you pointed out in v2.

- Daniel.
</pre>
  </body>
</html>

--------------AFFBA7020806D6E7AADC6BB7--

--===============0911251089499186665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0911251089499186665==--
