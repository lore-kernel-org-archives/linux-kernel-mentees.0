Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0CBC41513
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Jul 2023 18:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 433C781FAA;
	Mon, 24 Jul 2023 18:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 433C781FAA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=odRmqTs3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dTCrBf5gYg6; Mon, 24 Jul 2023 18:04:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E58E181FA0;
	Mon, 24 Jul 2023 18:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E58E181FA0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6690C0071;
	Mon, 24 Jul 2023 18:04:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 884F4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 18:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FDED6103E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 18:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDED6103E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=odRmqTs3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6tIx-Y-qygn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 18:04:17 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68E0460FF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 18:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68E0460FF6
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b962535808so65293511fa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690221855; x=1690826655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PMWehFMZvbk2xf8tY0y8u/pgKG1KcRSfvrbvLOT7Z4=;
 b=odRmqTs3LH+/X1SRqOKZRonsMr4xoVid28yxjd9SgkVuFAU/jW4ox/pkN85Ij8h9XI
 7XVza9c+4japLHxd5HRYDgOgCLI5pCk04S5W4RhksTDP2RgFQKQ7320qHlWHh0145wjo
 GzoDL4VZMgjJ+RGeVQbcjdqY87+IB2Ar1L2o87YwlR/7cbwBiJSrrg9llLl+0Pdq+2/r
 UwQ2nKQr5cyxqBVwYaCD4KUwXMJyPutsDuGFu29qkbktCwR9a54FK7vXzCi83i2UPNq0
 Tyc49T/BVusdUR8SZVpY4ZNGRZz7U68xWgSoobgvfHslVNqBjwgR7eZc/SkZNx15gILc
 ccNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690221855; x=1690826655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PMWehFMZvbk2xf8tY0y8u/pgKG1KcRSfvrbvLOT7Z4=;
 b=C6Xvr2MoemsF9pmwQPhys3dnY4GGArrlPpjrMUMwHaHZ8L2tilj8eLZIhy07e/WrwM
 IJhI9mRO2IgcwF4dJKBceeUxKkPQD+8c1oVrzz8TuMZFLJxyY4gzJA5fB+RCv8CE71f6
 3VvA8m49UBn4JuZOhmqMe4u+vpvfCZxkwtv+WpJPIdkNCl7A39QsxxZEXrmA4DiLbCbG
 SsvVZYCnE+5PisjQV1QubBxWfyNT6Rlj0WQx7YvBNkCSYE9Rs1x2okirESbCQhHVn9Jz
 YlgyNkYO7HIfORG66B/RRLWWK3gU8Cyfp+IxfkPmbtOSypI/ZLyRDAKjfU/9yv/xN6mG
 ehLA==
X-Gm-Message-State: ABy/qLZ7fRVgZ24/3d/V1SC/sJeF/JmagTkOE/wdo5gAcKrTfmXmLFdG
 y75w/Al1aY407Yo1l9jSuD6/ZWuRmnCjXZZPTMI=
X-Google-Smtp-Source: APBJJlGpD8jSoPQKAMxYJ3oCKN4xLFvwl4+ahXeikaglH6MeZrL6kPt9e2V1d55IknUvqBC5UWa4Oj+J/uJsbzuYFEA=
X-Received: by 2002:a2e:808a:0:b0:2b3:4ea3:d020 with SMTP id
 i10-20020a2e808a000000b002b34ea3d020mr6539375ljg.17.1690221855066; Mon, 24
 Jul 2023 11:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230723093806.2850822-1-mahmoudmatook.mm@gmail.com>
In-Reply-To: <20230723093806.2850822-1-mahmoudmatook.mm@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 24 Jul 2023 11:04:03 -0700
Message-ID: <CAADnVQKPmUxv6or76-KBVtaD2i+aRpX_qKxr1v7cwdOhWH6QLQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: fix build errors if
 CONFIG_NF_CONNTRACK_MARK not set.
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Cc: Hao Luo <haoluo@google.com>, Mykola Lysenko <mykolal@fb.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>,
 KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gU3VuLCBKdWwgMjMsIDIwMjMgYXQgMjozOOKAr0FNIE1haG1vdWQgTWFhdHVxCjxtYWhtb3Vk
bWF0b29rLm1tQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiAnbWFyaycgbWVtYmVyIGluICdzdHJ1Y3Qg
bmZfY29ubicgaXMgY29uZGl0aW9uYWxseSBkZWZpbmVkCj4gIGJ5IENPTkZJR19ORl9DT05OVFJB
Q0tfTUFSSwo+ICBzbyBhbnkgcmVmZXJlbmNlIHRvIGl0IHNob3VsZCBmb2xsb3cgdGhlIHNhbWUu
Cj4KPiAgJCBtYWtlIC1DIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZgo+ICAgICAgICAgcHJv
Z3MvdGVzdF9icGZfbmYuYzoyMTk6MTI6IGVycm9yOiBubyBtZW1iZXIgbmFtZWQgJ21hcmsnIGlu
ICdzdHJ1Y3QgbmZfY29ubicKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChj
dC0+bWFyayA9PSA0Mikgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+
ICBeCj4gICAgICAgICBwcm9ncy90ZXN0X2JwZl9uZi5jOjIyMDo5OiBlcnJvcjogbm8gbWVtYmVy
IG5hbWVkICdtYXJrJyBpbiAnc3RydWN0IG5mX2Nvbm4nCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGN0LT5tYXJrKys7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH5+ICBeCj4gICAgICAgICBwcm9ncy90ZXN0X2JwZl9uZi5jOjIyMToz
NDogZXJyb3I6IG5vIG1lbWJlciBuYW1lZCAnbWFyaycgaW4gJ3N0cnVjdCBuZl9jb25uJwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9leGlzdF9sb29rdXBfbWFyayA9IGN0
LT5tYXJrOwo+Cj4gU2lnbmVkLW9mZi1ieTogTWFobW91ZCBNYWF0dXEgPG1haG1vdWRtYXRvb2su
bW1AZ21haWwuY29tPgo+IC0tLQo+ICAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3Rl
c3RfYnBmX25mLmMgfCAxOSArKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy90ZXN0X2JwZl9uZi5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3Byb2dzL3Rlc3RfYnBmX25mLmMKPiBpbmRleCA3N2FkOGFkZjY4ZGEuLjBi
Mjg1ZGU4YjdlNyAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJv
Z3MvdGVzdF9icGZfbmYuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9n
cy90ZXN0X2JwZl9uZi5jCj4gQEAgLTE1Nyw3ICsxNTcsMTAgQEAgbmZfY3RfdGVzdChzdHJ1Y3Qg
bmZfY29ubiAqKCpsb29rdXBfZm4pKHZvaWQgKiwgc3RydWN0IGJwZl9zb2NrX3R1cGxlICosIHUz
MiwKPiAgICAgICAgICAgICAgICAgc3RydWN0IG5mX2Nvbm4gKmN0X2luczsKPgo+ICAgICAgICAg
ICAgICAgICBicGZfY3Rfc2V0X3RpbWVvdXQoY3QsIDEwMDAwKTsKPiAtICAgICAgICAgICAgICAg
Y3QtPm1hcmsgPSA3NzsKPiArICAgICAgICAgICAgICAgI2lmIGRlZmluZWQoQ09ORklHX05GX0NP
Tk5UUkFDS19NQVJLKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGN0LT5tYXJrID0gNzc7Cj4g
KyAgICAgICAgICAgICAgICNlbmRpZgo+ICsKPgo+ICAgICAgICAgICAgICAgICAvKiBzbmF0ICov
Cj4gICAgICAgICAgICAgICAgIHNhZGRyLmlwID0gYnBmX2dldF9wcmFuZG9tX3UzMigpOwo+IEBA
IC0xODgsNyArMTkxLDkgQEAgbmZfY3RfdGVzdChzdHJ1Y3QgbmZfY29ubiAqKCpsb29rdXBfZm4p
KHZvaWQgKiwgc3RydWN0IGJwZl9zb2NrX3R1cGxlICosIHUzMiwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJwZl9jdF9jaGFuZ2VfdGltZW91dChjdF9saywgMTAwMDApOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9kZWx0YV90aW1lb3V0ID0gY3RfbGst
PnRpbWVvdXQgLSBicGZfamlmZmllczY0KCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB0ZXN0X2RlbHRhX3RpbWVvdXQgLz0gQ09ORklHX0haOwo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGVzdF9pbnNlcnRfbG9va3VwX21hcmsgPSBjdF9say0+bWFyazsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNpZiBkZWZpbmVkKENPTkZJR19ORl9DT05O
VFJBQ0tfTUFSSykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVz
dF9pbnNlcnRfbG9va3VwX21hcmsgPSBjdF9say0+bWFyazsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICNlbmRpZgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnBm
X2N0X2NoYW5nZV9zdGF0dXMoY3RfbGssCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBJUFNfQ09ORklSTUVEIHwgSVBTX1NFRU5fUkVQTFkpOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9zdGF0dXMgPSBjdF9say0+c3Rh
dHVzOwo+IEBAIC0yMTAsMTAgKzIxNSwxMiBAQCBuZl9jdF90ZXN0KHN0cnVjdCBuZl9jb25uICoo
Kmxvb2t1cF9mbikodm9pZCAqLCBzdHJ1Y3QgYnBmX3NvY2tfdHVwbGUgKiwgdTMyLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKG9wdHNfZGVmKSk7Cj4gICAgICAgICBpZiAoY3QpIHsK
PiAgICAgICAgICAgICAgICAgdGVzdF9leGlzdF9sb29rdXAgPSAwOwo+IC0gICAgICAgICAgICAg
ICBpZiAoY3QtPm1hcmsgPT0gNDIpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBjdC0+bWFy
aysrOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHRlc3RfZXhpc3RfbG9va3VwX21hcmsgPSBj
dC0+bWFyazsKPiAtICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICAjaWYgZGVmaW5l
ZChDT05GSUdfTkZfQ09OTlRSQUNLX01BUkspCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGN0LT5tYXJrID09IDQyKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdC0+
bWFyaysrOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9leGlzdF9sb29r
dXBfbWFyayA9IGN0LT5tYXJrOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAg
ICAgICAgICAgI2VuZGlmCgpUaGF0J3Mgbm90IGEgZml4LgpUaGUgdGVzdCBoYXMgdG8gaGF2ZSBD
T05GSUdfTkZfQ09OTlRSQUNLX01BUksgZW5hYmxlZCBpbiB0aGUga2VybmVsLgpNYWtlIHN1cmUg
eW91ciBrZXJuZWwgaXMgYnVpbHQgd2l0aCBfYWxsXyBjb25maWdzIHNwZWNpZmllZCBpbgp0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnKgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QK
TGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVu
dGVlcwo=
