Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F70CC04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 06:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F8041944;
	Thu, 10 Aug 2023 06:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F8041944
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fShcXfPy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POSUOuqx0ajV; Thu, 10 Aug 2023 06:46:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7832841936;
	Thu, 10 Aug 2023 06:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7832841936
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F2A4C0072;
	Thu, 10 Aug 2023 06:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F611C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 06:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 167ED60FF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 06:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 167ED60FF9
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fShcXfPy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQJDZERFLyZ1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 06:46:55 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C48FB60B26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 06:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48FB60B26
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5237365f3a6so658192a12.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Aug 2023 23:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691650013; x=1692254813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d97DNxVWndRKqy+GYLUUwTxQ5wSEsSYDcK7bljZp6nM=;
 b=fShcXfPyq5qTLCY/hQVnKm0r+Fz1cWZbRI6whRrplxAtEaOAvSNl/QW55WZ4OWIVUQ
 nkM3mryRvhgEptszJeJvJTLwPW6pDtlbZDRSQmQSIHGPHSaCe++dzkz948vwpEvv22wQ
 7hrCdpMjaYC+s/dofUAUWnwBy5125U/oushoyb+K/W8oExKlQwjn0SIVcX/MPN2epsn1
 J3dc0NtrnbzUge744OmpfaYD33NwztV5USXEsk3oWu72Yx/In4wy6u2STE7kM96i6mGk
 w/yFRaGe4xTmHbC775KZ0lUZVoBBtqESIjss+7LGjwngnYcbKNacPFyCISmKniBjerAh
 7/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691650013; x=1692254813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d97DNxVWndRKqy+GYLUUwTxQ5wSEsSYDcK7bljZp6nM=;
 b=M9wZI+QmVuv46iIhJOBlGSoThIpzrAR3PsRm8nxckLanC2txYTdwv0EtW66qRGVVOb
 CVgaQHCkd+0MBKX7Az9UcXT0FT9STeHYqFSn0pHnhw1AgGTGBVZ2e3a1+OLYQZfJYHup
 91R6PISdtuc4mqE3wzozuqbCyjJ6ZTXhUAyualqDa31LUS2lqqVi3f7k84tzftshtYnp
 qlTHBAj0fHPqLCIBTj4NmIInoja+Jpwxr9pnf4PM6wWHZ+jnyv95HV291Yz3nd24uI/7
 6/Ei+PvlDCqEd7kBLm/Wd7oibL8QHxnh7iNQF/+VAti5pUFeCU5qP5nTjoIHMShMVbtO
 wzMw==
X-Gm-Message-State: AOJu0YwdMGWN0nFfod44SBUGYJ9+kHflrpJfXyZ+a1TDRmnLMXR2ixbV
 nBwVwjIUGm1GE67WEcDQwAM0k03Peq7A4FDlMIA=
X-Google-Smtp-Source: AGHT+IEwWVlBeLryVc/eVOBBpMdYCkROMbaNhtiRKBVmwPQPhVZYoNNJyQh4qTwTplR/yAaIor0VgaZyup3j8VKzHP4=
X-Received: by 2002:a05:6402:184d:b0:522:41b8:3dad with SMTP id
 v13-20020a056402184d00b0052241b83dadmr1303993edy.15.1691650012582; Wed, 09
 Aug 2023 23:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230809171245.92081-1-coolrrsh@gmail.com>
In-Reply-To: <20230809171245.92081-1-coolrrsh@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Thu, 10 Aug 2023 12:46:41 +0600
Message-ID: <CAABMjtECX_p=G_Vwedxn3xuxm+WDy7hnyuSVc_rTNDr9yXKrYA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCAxMToxMuKAr1BNIDxjb29scnJzaEBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gRnJvbTogUmFqZXNod2FyIFIgU2hpbmRlIDxjb29scnJzaEBnbWFpbC5jb20+Cj4K
PiBVc2Ugb2YgbWFjcm8gQVJSQVlfU0laRSB0byBjYWxjdWxhdGUgYXJyYXkgc2l6ZSBtaW5pbWl6
ZXMKPiB0aGUgcmVkdW5kYW50IGNvZGUgYW5kIGltcHJvdmVzIGNvZGUgcmV1c2FiaWxpdHkuCj4g
VGhpcyBmaXhlcyB3YXJuaW5ncyByZXBvcnRlZCBieSBDb2NjaW5lbGxlOgo+IGRyaXZlcnMvZ3Bp
by9ncGlvLWlteC1zY3UuYzoxMDY6MzItMzM6IFdBUk5JTkc6IFVzZSBBUlJBWV9TSVpFCj4KPiBT
aWduZWQtb2ZmLWJ5OiBSYWplc2h3YXIgUiBTaGluZGUgPGNvb2xycnNoQGdtYWlsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncGlvL2dwaW8taW14LXNjdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwaW8vZ3Bpby1pbXgtc2N1LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1pbXgtc2N1LmMKPiBpbmRl
eCBlMTkwYmRlNTM5N2QuLmZiMDVhNTNjOTcxMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8v
Z3Bpby1pbXgtc2N1LmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1pbXgtc2N1LmMKPiBAQCAt
MTAzLDcgKzEwMyw3IEBAIHN0YXRpYyBpbnQgaW14X3NjdV9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBnYyA9ICZwcml2LT5jaGlwOwo+ICAgICAgICAg
Z2MtPmJhc2UgPSAtMTsKPiAgICAgICAgIGdjLT5wYXJlbnQgPSBkZXY7Cj4gLSAgICAgICBnYy0+
bmdwaW8gPSBzaXplb2Yoc2N1X3JzcmNfYXJyKS9zaXplb2YodW5zaWduZWQgaW50KTsKPiArICAg
ICAgIGdjLT5uZ3BpbyA9IEFSUkFZX1NJWkUoc2N1X3JzcmNfYXJyKS9zaXplb2YodW5zaWduZWQg
aW50KTsKU2luY2UgQVJSQVlfU0laRSBpcyBiZWluZyB1c2VkLCBubyBuZWVkIHRvIGRpdmlkZSBp
dCB3aXRoIHNpemVvZiB1bnNpZ25lZCBpbnQKYWdhaW4uCi4uLgogZ2MtPm5ncGlvID0gQVJSQVlf
U0laRShzY3VfcnNyY19hcnIpOwouLi4KCj4gICAgICAgICBnYy0+bGFiZWwgPSBkZXZfbmFtZShk
ZXYpOwo+ICAgICAgICAgZ2MtPmdldCA9IGlteF9zY3VfZ3Bpb19nZXQ7Cj4gICAgICAgICBnYy0+
c2V0ID0gaW14X3NjdV9ncGlvX3NldDsKPiAtLQo+IDIuMjUuMQoKdGhhbmtzLAogIC0tIEtoYWxp
ZCBNYXN1bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
