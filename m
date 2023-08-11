Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBE4C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Aug 2023 14:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D0CE83077;
	Fri, 11 Aug 2023 14:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D0CE83077
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20221208.gappssmtp.com header.i=@bgdev-pl.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=osOhofgu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POFMRsEy5ZVG; Fri, 11 Aug 2023 14:21:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF32F81E6E;
	Fri, 11 Aug 2023 14:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF32F81E6E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8232C0071;
	Fri, 11 Aug 2023 14:21:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11C7FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 14:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D42C960A5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 14:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42C960A5D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20221208.gappssmtp.com
 header.i=@bgdev-pl.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=osOhofgu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zltwuRsFCMnf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 14:21:04 +0000 (UTC)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63E94607F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 14:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E94607F1
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-79a41b1bccfso645464241.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691763663; x=1692368463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQng/hRo3S30Mxt8z7DZS4O6mVqACPu6LumofMm+Vmk=;
 b=osOhofguygoBMgF/n98pSgcj8+YgL8cMIvfUKTtJH2T6eT5CnBwDFROVviiRIzAwQA
 u5XScutDkrV8/v6uvL147doCcmDOsxDksJHxWc7lGJOEQ6BXsHbXXX5oa71pQfFofpoe
 lLJNBN6iAurKGvlrf8KG2aCntS3/yEthc1TXZy/3SGDaJhLOG2j9/HD3OpRAfyd4bs+S
 BxrU33lsCCPn4LhKb1DW+q7pO/ic6r7dOrx08d2YSpp3igRD02/eIM8haMPyNDJqti92
 Uha01MKbfVhiwgZSUx1NFALWmE00nLqA70SmjSQWBx4Xijz3XovtaCOjrozj/YuoilVR
 nIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691763663; x=1692368463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQng/hRo3S30Mxt8z7DZS4O6mVqACPu6LumofMm+Vmk=;
 b=HezGYqpG6+ZjMpa9CvVlpQSb0Qfot/k4yXwdlb20Libn4G1g5d5jNRK7sp6mKjX9vf
 cHiFXhFui2x8KTTvhBOqON4WoTe1eloev3MZ5p18iExGTywATAe1Mljc2Jfp6o17Khdc
 kOg/OJZ9dU4e9LyfJ60+f7cajROdUp/DF19QvAfu91HK4c/oly30YlTU6AxhddtYWAML
 76BXDD1X2a4vWywPwUgrsnNOybsJqqTDz/BT+Boy1UO6JQy07rQT8zLROHL5eJ/cgRRX
 XNTOoTq3a442gmnUJZY8jEEVPdDdL57A/KZyYpuTDtS1GvhtxOCYvL4qyKwc06q/QarK
 h8KQ==
X-Gm-Message-State: AOJu0YzUhYb6NYxNC7oAvC46utdE9JhC7CYIrXfLg0gjG+G2zuubvdpY
 gVJI4b5UGKS3EbBQL7UkZ0t6HJUyhi+CCqz/la9HJQ==
X-Google-Smtp-Source: AGHT+IEa5U46ipufvHjb6BQME08e5uq0HIveM2QdbEcn8haHEINqOHLNuQXsAithgiLeeqGKHtosefHdSmmsdSTF3II=
X-Received: by 2002:a67:ea58:0:b0:430:e0:ac2e with SMTP id
 r24-20020a67ea58000000b0043000e0ac2emr1868082vso.15.1691763663053; 
 Fri, 11 Aug 2023 07:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230810130600.25616-1-coolrrsh@gmail.com>
In-Reply-To: <20230810130600.25616-1-coolrrsh@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Aug 2023 16:20:52 +0200
Message-ID: <CAMRc=Md4K1KwXiC69QqK_Kk02+4vEiu2Leir9OT4hy=jSzaXpA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
To: coolrrsh@gmail.com
Cc: andy@kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMzowNuKAr1BNIDxjb29scnJzaEBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gRnJvbTogUmFqZXNod2FyIFIgU2hpbmRlIDxjb29scnJzaEBnbWFpbC5jb20+Cj4K
PiBVc2Ugb2YgbWFjcm8gQVJSQVlfU0laRSB0byBjYWxjdWxhdGUgYXJyYXkgc2l6ZSBtaW5pbWl6
ZXMKPiB0aGUgcmVkdW5kYW50IGNvZGUgYW5kIGltcHJvdmVzIGNvZGUgcmV1c2FiaWxpdHkuCj4g
VGhpcyBmaXhlcyB3YXJuaW5ncyByZXBvcnRlZCBieSBDb2NjaW5lbGxlOgo+IGRyaXZlcnMvZ3Bp
by9ncGlvLWlteC1zY3UuYzoxMDY6MzItMzM6IFdBUk5JTkc6IFVzZSBBUlJBWV9TSVpFCj4KPiBT
aWduZWQtb2ZmLWJ5OiBSYWplc2h3YXIgUiBTaGluZGUgPGNvb2xycnNoQGdtYWlsLmNvbT4KPiAt
LS0KPiB2MS0+djIKPiBBUlJBWV9TSVpFIGNhbGN1bGF0ZXMgYXJyYXkgbGVuZ3RoLCBzbyBjaGFu
Z2VkCj4gZ2MtPm5ncGlvID0gQVJSQVlfU0laRShzY3VfcnNyY19hcnIpL3NpemVvZih1bnNpZ25l
ZCBpbnQpIHRvCj4gZ2MtPm5ncGlvID0gQVJSQVlfU0laRShzY3VfcnNyY19hcnIpCj4KPiB2Mi0+
djMKPiBhZGRlZCBsaW51eC9rZXJuZWwuaCBjb250YWluaW5nIEFSUkFZX1NJWkUgZGVmaW5pdGlv
bgo+Cj4gLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLWlteC1zY3UuYyB8IDMgKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwaW8vZ3Bpby1pbXgtc2N1LmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1pbXgtc2N1
LmMKPiBpbmRleCBlMTkwYmRlNTM5N2QuLjEzYmFmNDY1YWVkZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwaW8vZ3Bpby1pbXgtc2N1LmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1pbXgtc2N1
LmMKPiBAQCAtNiw2ICs2LDcgQEAKPiAgICogdG8gY29udHJvbCB0aGUgUElOIHJlc291cmNlcyBv
biBTQ1UgZG9tYWluLgo+ICAgKi8KPgo+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVyLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiBAQCAtMTAzLDcgKzEwNCw3
IEBAIHN0YXRpYyBpbnQgaW14X3NjdV9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gICAgICAgICBnYyA9ICZwcml2LT5jaGlwOwo+ICAgICAgICAgZ2MtPmJhc2UgPSAt
MTsKPiAgICAgICAgIGdjLT5wYXJlbnQgPSBkZXY7Cj4gLSAgICAgICBnYy0+bmdwaW8gPSBzaXpl
b2Yoc2N1X3JzcmNfYXJyKS9zaXplb2YodW5zaWduZWQgaW50KTsKPiArICAgICAgIGdjLT5uZ3Bp
byA9IEFSUkFZX1NJWkUoc2N1X3JzcmNfYXJyKTsKPiAgICAgICAgIGdjLT5sYWJlbCA9IGRldl9u
YW1lKGRldik7Cj4gICAgICAgICBnYy0+Z2V0ID0gaW14X3NjdV9ncGlvX2dldDsKPiAgICAgICAg
IGdjLT5zZXQgPSBpbXhfc2N1X2dwaW9fc2V0Owo+IC0tCj4gMi4yNS4xCj4KClRoZSBjb21taXQg
dGl0bGUgc2hvdWxkIGJlICJncGlvOiBpbXgtc2N1OiAuLi4iCgpJIGZpeGVkIGl0IGFuZCBhcHBs
aWVkLgoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNA
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
