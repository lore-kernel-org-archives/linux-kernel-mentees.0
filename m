Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC58C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 10:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93645404DD;
	Thu, 10 Aug 2023 10:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93645404DD
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GPvrgMmq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljC-arC0TSdc; Thu, 10 Aug 2023 10:41:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A031D400D1;
	Thu, 10 Aug 2023 10:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A031D400D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 726CAC0072;
	Thu, 10 Aug 2023 10:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AE44C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 10:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C684417C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 10:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C684417C6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GPvrgMmq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF_LzRCdkpJd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 10:41:01 +0000 (UTC)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB61B417C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 10:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB61B417C2
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-56ce936f7c0so606088eaf.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 03:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691664060; x=1692268860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzGgdaSbIbO5607Bipi/BVOCslTkWPmDB2/kSSg0w98=;
 b=GPvrgMmq+chXVdFnEk9PGz2ydLogpF32PvUNg+4t9DmG3TwOcFvqJWeNdqylVbUIhQ
 RSOAX76SyLgThVlrNP/+88CJvg3E4dEH7qJ4Vyy8Bt2nZntX3FvEvRtfmLs3/tuk5dzP
 GUmD/GXjr7uC7TKx0t1UnP1ixWKazUF1DMqsQuMeulNN+XheZgG+AhrV/tJ57oWPrDuU
 1SEldI0rfzBWNPOtcoHN324a/dA8j5zuIm7YJcf5gKgJznWRYWkw4dkKdwmsICGMAdFg
 yj+KFap3WeMmn2rGW8b391L6YE91Ka+XeW9AW6thBHYR8KVqhrvjep8hZHMjbtcElkTu
 YTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691664060; x=1692268860;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzGgdaSbIbO5607Bipi/BVOCslTkWPmDB2/kSSg0w98=;
 b=D/3r0hJ+jovU7s11elFpJNU+GGrzgQyqXFJO9n5BiCEpJzkr/c79CDD5OyqqVgXlqC
 FwdFkaa4bT+Bui9L6uXS+8Ql6BnK8iZS3zq298lWPUaFEtp7SmwkMhpHxSNdjxXvAYaE
 s9uCg0GgkVsX4wBLocTaIEqTXm9gTTTxVk2CxbdxeQV6JRUpAl6RTMCMELLap2Q9QWHQ
 aRBySC5gFgnLafuOyKm90Pq+jARe7afmFWC7cZZPR8OS8Ee6mCHnBsdZ15mxArUnjMCE
 k+7E3Kmz0pBzmKcBEzf41IEKExSjhXuYqtCtE+q7AJhEBu4fpX4KKgzXB8opcJpoe22/
 gsLg==
X-Gm-Message-State: AOJu0YxPPLS+FzMzjAmYgnGxL+Wtfu5wTeduMgA2GYI8hElJOFiok/MV
 LmQTxEad7fk5jkHIKfLXlEyo2GvCkZXAlu68Kp8=
X-Google-Smtp-Source: AGHT+IE472b1bBC1wnLWrRDe+WBNUm860iODbGwa4NJ/eoWfeoqPR7DWvpHGMbjOH3OcpROQ7IS0Vh10NJjlFUVmpzY=
X-Received: by 2002:a05:6820:47:b0:56c:cd0c:1d67 with SMTP id
 v7-20020a056820004700b0056ccd0c1d67mr1616704oob.7.1691664059810; Thu, 10 Aug
 2023 03:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230810074633.13111-1-coolrrsh@gmail.com>
In-Reply-To: <20230810074633.13111-1-coolrrsh@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Aug 2023 13:40:23 +0300
Message-ID: <CAHp75VfmnY1u2d4UX1qoKALqE--3+CUSGn9oDudCPZDa_-0GTA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
To: coolrrsh@gmail.com
Cc: andy@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 brgl@bgdev.pl
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMTA6NDbigK9BTSA8Y29vbHJyc2hAZ21haWwuY29tPiB3
cm90ZToKPgo+IEZyb206IFJhamVzaHdhciBSIFNoaW5kZSA8Y29vbHJyc2hAZ21haWwuY29tPgo+
Cj4gVXNlIG9mIG1hY3JvIEFSUkFZX1NJWkUgdG8gY2FsY3VsYXRlIGFycmF5IHNpemUgbWluaW1p
emVzCj4gdGhlIHJlZHVuZGFudCBjb2RlIGFuZCBpbXByb3ZlcyBjb2RlIHJldXNhYmlsaXR5Lgo+
IFRoaXMgZml4ZXMgd2FybmluZ3MgcmVwb3J0ZWQgYnkgQ29jY2luZWxsZToKPiBkcml2ZXJzL2dw
aW8vZ3Bpby1pbXgtc2N1LmM6MTA2OjMyLTMzOiBXQVJOSU5HOiBVc2UgQVJSQVlfU0laRQoKLi4u
Cgo+IC0gICAgICAgZ2MtPm5ncGlvID0gc2l6ZW9mKHNjdV9yc3JjX2Fycikvc2l6ZW9mKHVuc2ln
bmVkIGludCk7Cj4gKyAgICAgICBnYy0+bmdwaW8gPSBBUlJBWV9TSVpFKHNjdV9yc3JjX2Fycik7
CgpBbmQgeW91IG5lZWQgdG8gaW5jbHVkZSBrZXJuZWwuaCBmb3IgdGhpcy4KCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51
eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVz
Cg==
