Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C474CD8CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 16:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00748139A;
	Tue, 10 Oct 2023 16:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00748139A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=GawS2Ocr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxRNrfsmS2IX; Tue, 10 Oct 2023 16:49:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E786280EBB;
	Tue, 10 Oct 2023 16:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E786280EBB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF519C0039;
	Tue, 10 Oct 2023 16:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5157C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 16:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF5644016D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 16:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5644016D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20230601 header.b=GawS2Ocr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKcaHmcY_K58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 16:49:49 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80E2A41D83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 16:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E2A41D83
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-537f07dfe8eso118a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696956587; x=1697561387;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzghsbCDjRJsjSD3ib2zlQsnADkOVOzAmS7OkMaiGB8=;
 b=GawS2Ocr2TqNUcyBCmr1kyTerp1P96Y6cqYqGdbWmGiHdUkQLr+dkSLzSUIOio5iDg
 DQOpDhOW8JwJih67qkbX5U5ZtgGWdyvJVemjHf3pAy2ljQRSK6dl9HCEdiszi+wIBpi8
 zpwMBM2y0wiUyuNl4RBPPZnvMwEBu9A3/J9zEak6hxHRzRBzb4p5TL8vzjKhMI7g3bcN
 GfMpMtV4sRkZaQJqoYXU1L3Jm4KZWZb5vz7nX1fXhmwUnIM4vdBw1xsuG04mHaM4jgwb
 S67A/zR4Wp5AObCTDZnDC8SqFE+yYqbqJBh0w4wFNmEBEQ8qJPncDaim06YxJd2QWX/1
 rMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696956587; x=1697561387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzghsbCDjRJsjSD3ib2zlQsnADkOVOzAmS7OkMaiGB8=;
 b=lLY92qIquzshPfGCNVsQ8sAYwIDjpxEJbhLnogLtdZ5xn8LENWKYBypuYQqU5e4F5x
 W7ONgSQHnHQKyOoax2GA7Ti7UisBOOUNAQMivfAkh+3bv2uEXTs1nX/W5L3md2qK64us
 dr7xMXJIOtd3cdkU2v04JPhxhGdAHuq3r0evEy/HqCrybmDqPD7eejOZClW9hpaCxE+f
 WPLQnbdw9pRRRxBxaTa2uf1JKSq0KuuTOmBfiGqAguqAWyPBgb2HEHI+QURolSbvAos0
 nf1ZQVI4f9zz/4tr2z8T6fODTRcspvN1koXkOUHBEZzd8dljisf0iTEk7rycO7q1ON+E
 xvsw==
X-Gm-Message-State: AOJu0Yzr15JS4qJPRlhlil1D48+5hrWTyZC/PX6wGLyz75O4oOLKJISL
 BusJ9h/PSZmkaQWWfZ1qQ1S4Ty5J9G9uJDBYIu1dUQ==
X-Google-Smtp-Source: AGHT+IHCGN9JNYAYRJrPJuZIMwYUV0QgxRaw9dM4fLl3AFJYUBdk+FWKGZlP839JVyblIgW4mGse8vBPdDX6ad6Gjas=
X-Received: by 2002:a50:aada:0:b0:538:50e4:5446 with SMTP id
 r26-20020a50aada000000b0053850e45446mr1171edc.5.1696956587422; Tue, 10 Oct
 2023 09:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
Date: Tue, 10 Oct 2023 10:49:36 -0600
Message-ID: <CAMkAt6o7urak_kAjxEU4wtXv-mGOnyOYdcyhCRMfAG3MAOip0g@mail.gmail.com>
Subject: Re: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org, seanjc@google.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, pbonzini@redhat.com, tglx@linutronix.de,
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
From: Peter Gonda via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Peter Gonda <pgonda@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgNToyMuKAr0FNIEpvc8OpIFBla2thcmluZW4KPGpvc2Uu
cGVra2FyaW5lbkBmb3hob3VuZC5maT4gd3JvdGU6Cj4KPiBUaGVyZSBhcmUgYmlvc2VzIHRoYXQg
ZG9lc24ndCBhbGxvdyB0byBjb25maWd1cmUgdGhlCj4gbnVtYmVyIG9mIGFzaWRzIGFsbG9jYXRl
ZCBmb3IgU0VWL1NFVi1FUywgZm9yIHRob3NlCj4gY2FzZXMsIHRoZSBkZWZhdWx0IGJlaGF2aW91
ciBhbGxvY2F0ZXMgYWxsIHRoZSBhc2lkcwo+IGZvciBTRVYsIGxlYXZpbmcgbm8gcm9vbSBmb3Ig
U0VWLUVTIHRvIGhhdmUgc29tZSBmdW4uCj4gSWYgdGhlIHVzZXIgcmVxdWVzdCBTRVYtRVMgdG8g
YmUgZW5hYmxlZCwgaXQgd2lsbAo+IGZpbmQgdGhlIGtlcm5lbCBqdXN0IHJ1biBvdXQgb2YgcmVz
b3VyY2VzIGFuZCBpZ25vcmVkCj4gdXNlciByZXF1ZXN0LiBUaGlzIGZvbGxvd2luZyBwYXRjaCB3
aWxsIGFkZHJlc3MgdGhpcwo+IGlzc3VlIGJ5IG1ha2luZyB0aGUgbnVtYmVyIG9mIGFzaWRzIGZv
ciBTRVYvU0VWLUVTCj4gY29uZmlndXJhYmxlIG92ZXIga2VybmVsIG1vZHVsZSBwYXJhbWV0ZXJz
Lgo+CgpBbGwgdGhpcyBwYXRjaCBkb2VzIGlzIGludHJvZHVjZSBhbiBlcnJvciBjYXNlIHJpZ2h0
PyBCZWNhdXNlIGlmIHRoZQpCSU9TIGhhc24ndCBhY3R1YWxseSBjb25maWd1cmVkIHRob3NlIFNF
Vi1FUyBhc2lkcyBhbmQgS1ZNIHRyaWVzIHRvCnVzZSBhbiBTRVYgYXMgYW4gU0VWLUVTIGFzaWQg
Y29tbWFuZHMgdG8gdGhlIEFTUCB3aWxsIGZhaWwsIHJpZ2h0PwoKV2hhdCBoYXBwZW5zIHdoZW4g
eW91IHRyeSB0byBjcmVhdGUgYW4gU0VWLUVTIFZNIHdpdGggdGhpcyBwYXRjaCwgd2hlbgp0aGUg
QklPUyBoYXNuJ3QgYWxsb2NhdGVkIGFueSBTRVYtRVMgYXNpZHM/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxp
bmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtl
cm5lbC1tZW50ZWVzCg==
