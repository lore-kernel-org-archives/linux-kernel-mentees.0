Return-Path: <SRS0=rtwA=2O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F88C2D0C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Dec 2019 18:27:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C206B2063A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Dec 2019 18:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAVHkDzW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C206B2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B9C485070;
	Tue, 24 Dec 2019 18:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SiBC4sWWdfcN; Tue, 24 Dec 2019 18:27:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B74E8502B;
	Tue, 24 Dec 2019 18:27:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 013AAC18DD;
	Tue, 24 Dec 2019 18:27:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87408C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Dec 2019 18:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6D31585065
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Dec 2019 18:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqHHusSWZ1cS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Dec 2019 18:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D584E8506B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Dec 2019 18:27:06 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z16so11083150pfk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Dec 2019 10:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=1mGCf5hzKA0VOInTnIObfs1oSmmO0pcFk2p8AwdLZgs=;
 b=nAVHkDzWQlR5JtMmoS1W3x1TlOWGESQ35VLGiBnDVkmlCr1wYrgPGlnrw6pdFEeAp4
 fvc2eN1CZEFcrzjiz7viWfNKa7KSKlk9xqQCnYgpV7xNGDKEtWsqf2/nWMf/j3IXs0e1
 R0iH/gH0NH+bdc4ZMlvkhhPrkdm6kEvAon6Ew+K1kGaMtHpecFWZde9IB/3UxyDl+R8J
 yeW1QNIQkyiwpjnzUnLj8zvdwAEgG6WlTzUaOfsEtxbSiW5z9HEJgC7uTPqpd0NNJoQy
 qocsEWNmlH/VUMIZ50ufUeIiRm0XGQ8/Gz3UIae3ylEEKoKVftjdM2TWGtuso+DTSdao
 ZNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=1mGCf5hzKA0VOInTnIObfs1oSmmO0pcFk2p8AwdLZgs=;
 b=idC6NRhbHJ7rK97pyFXb4pL/FqJ1noFxe39MCo8OWaUrWYI8Y90xFa8ENHcwEb8jql
 7VCIcsYJ8nEY0J7+7LrOxF+TBElBrqXHiQonvjVuftEk+8PZHlI/V2ZCpGg9Jsm/St23
 +vJBR5fJOxof9AoAsIQQkOaCm4em5jNq6+FLfG8kjq5A5Rln0W+0EhrIEZRrcSeOb4QG
 s0beuqDr7TbHlAAWvNM1yab7dnNw4zLohCEVGL90Lw14n0p15LY36qKOxoHSGsPEVwcp
 Kl0q0roIKj1zQbTlR0fS2GuLMWwGZGZOgY0K6Gg+NTbQpi5+5YCsrPW0pcgRQFvlS7dA
 jc7w==
X-Gm-Message-State: APjAAAWs/jjMtA5/c3TOdLVHwiicdJZddJBYEpJzx6woMofCr8i8YnxX
 xWgNyOdOLGtQArrjWzZSrx8=
X-Google-Smtp-Source: APXvYqwgk3L6+E43vrU8QYsmgG4w0gSLbLcx+2RayUuU241aQKSfJbMoVkdlkNFeT5SyoSkEWv+mjQ==
X-Received: by 2002:aa7:86c3:: with SMTP id h3mr29247060pfo.225.1577212026556; 
 Tue, 24 Dec 2019 10:27:06 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id t23sm31863671pfq.106.2019.12.24.10.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2019 10:27:06 -0800 (PST)
To: Markus Heiser <markus.heiser@darmarit.de>, corbet@lwn.net,
 miklos@szeredi.hu
References: <20191223012248.606168-1-dwlsalmeida@gmail.com>
 <91ded87c-ca70-bcf7-49fc-fa2988f4e36b@darmarit.de>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <021221ea-9e1d-78ed-3ca9-dea232e0cddd@gmail.com>
Date: Tue, 24 Dec 2019 15:27:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <91ded87c-ca70-bcf7-49fc-fa2988f4e36b@darmarit.de>
Content-Language: en-US
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] Documentation: filesystems:
	convert fuse to RST
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
Content-Type: multipart/mixed; boundary="===============3367087737221028771=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============3367087737221028771==
Content-Type: multipart/alternative;
 boundary="------------E90591FDA7BEDDA2DB377983"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E90591FDA7BEDDA2DB377983
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Markus!


> drop empty line, use definition list[1] / you used definition list 
> everywhere except here.  I guess the follwowing matches better:
>
>
> ``fuse``
>   This is the usual way to mount a FUSE filesystem. ...
>
> ``fuseblk``
>   The filesystem is block device based. ..
>
> [1] 
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#definition-lists 
>
>
> -- Markus -- 

To be honest I had not realized that! Good catch!


Also, do you mean it would be better to switch the terms from **term** 
to ``term`` in all the other definition lists as well?

[note: pardon me for the duplicate email...forgot to 'reply to all']

--------------E90591FDA7BEDDA2DB377983
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Markus!
    <br>
    <br>
    <br>
    <blockquote type="cite" style="color: #000000;">drop empty line, use
      definition list[1] / you used definition list everywhere except
      here.  I guess the follwowing matches better:
      <br>
      <br>
      <br>
      ``fuse``
      <br>
        This is the usual way to mount a FUSE filesystem. ...
      <br>
      <br>
      ``fuseblk``
      <br>
        The filesystem is block device based. ..
      <br>
      <br>
      [1] <a class="moz-txt-link-freetext"
href="https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#definition-lists">https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#definition-lists</a>
      <br>
      <br>
      -- Markus -- </blockquote>
    <br>
    To be honest I had not realized that! Good catch!
    <br>
    <br>
    <br>
    Also, do you mean it would be better to switch the terms from
    **term** to ``term`` in all the other definition lists as well?
    <br>
    <br>
    [note: pardon me for the duplicate email...forgot to 'reply to all']<br>
  </body>
</html>

--------------E90591FDA7BEDDA2DB377983--

--===============3367087737221028771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3367087737221028771==--
