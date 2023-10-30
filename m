Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FE5C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 16:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD40817B1;
	Mon, 30 Oct 2023 16:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD40817B1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JdKqIqnW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uCi0SJ1A8n3l; Mon, 30 Oct 2023 16:12:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4A8FB817AE;
	Mon, 30 Oct 2023 16:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A8FB817AE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 280ECC0071;
	Mon, 30 Oct 2023 16:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5265C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ABC4410E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABC4410E5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20230601 header.b=JdKqIqnW
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOeZOIn3Y5mI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:12:56 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA378410E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA378410E1
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5afacc566f3so34552117b3.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698682374; x=1699287174;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Tgkw7eW9dhnk+knrp7jJaqDTfZMev9xwF7TYvvMUsbc=;
 b=JdKqIqnWWr2HStXUImCRmS8iog5lYg1qA0mAMQgSZPrTCaOV54KMgu39YL23CiJn5u
 L8radXjKqHAV7PeieoCHGfRed0zU9eS4VliPMIMXCkfFLlIjEpFd8GLM+Ue2T+dpi3Z+
 4CXm8fEKfoMqmPztrFCxhanh6AxMQgY4nFevtt61rbRwlyLLlHr1aiuwRoryXPoR9YYJ
 J7xkZgZPLIv+E/bMbM5pZLd1kbHynvV/CtuA9PX6U9EVUU1IUwDAgvwRnBsvUvTA+d5l
 XevSx1La0GWHFtPy9y2F6ZH8QkCNO8ybW1xpGJ/VuUX7V8C7LdqMlXiL3HGuoaEfJ6L+
 Ul5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698682374; x=1699287174;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Tgkw7eW9dhnk+knrp7jJaqDTfZMev9xwF7TYvvMUsbc=;
 b=O79J2pC9ZdqcBNTj0D3kVgW5ZzCrl6GTJsUrrZZTxJczQbzPcgvBtJX3qBw1O43Mrn
 VaM+cwKenTcdAlYcvPsjpVIFiSgc8SE17bMGkn7MRvQCvwUw1ysJ6ls4ILoL8Y4558rG
 pS1OfN4sKOBBA4PMclcb0KG3I77SvV+5xa6zD9sacqNmvyVDcwHDzRjgD7wK1bTncQfx
 GOd7XmF9NT7M5FptABildCQnKrMMx0hFgL4RSqCipOmw2QKI0lq69VkDQjGKB0R74l71
 Sy4hab04FoLHcEHzYwUCD2GE+bu3s1XMuRqyGBUdBSjgsSe2TOZH4fjP0ukeo8JRUfBt
 t/dA==
X-Gm-Message-State: AOJu0Yxcx8kKrMi9DmJW/XqzmDjI9asuRtcXGnQCTbClEI9FOQPn77zx
 okWEe7bXyasMSexTZcP2mjY3VN1rLiw=
X-Google-Smtp-Source: AGHT+IHXERmhF1p7ZLDX+e5zNpxMNE30YgXaemlxnBQEovmUJpclQzlFIZqH7J8ykW6OvSDZcwj8yNLtP1w=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:920b:0:b0:59b:f3a2:cd79 with SMTP id
 j11-20020a81920b000000b0059bf3a2cd79mr205625ywg.8.1698682374564; Mon, 30 Oct
 2023 09:12:54 -0700 (PDT)
Date: Mon, 30 Oct 2023 09:12:53 -0700
In-Reply-To: <20231029093928.138570-1-jose.pekkarinen@foxhound.fi>
Mime-Version: 1.0
References: <20231029093928.138570-1-jose.pekkarinen@foxhound.fi>
Message-ID: <ZT_WBanoip8zhxis@google.com>
Subject: Re: [PATCH] KVM: x86: replace do_div with div64_ul
To: "=?utf-8?B?Sm9zw6k=?= Pekkarinen" <jose.pekkarinen@foxhound.fi>
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org,
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gU3VuLCBPY3QgMjksIDIwMjMsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gUmVwb3J0ZWQg
YnkgY29jY2luZWxsZSwgdGhlcmUgaXMgYSBkb19kaXYgY2FsbCB0aGF0IGRvZXMKPiA2NC1ieS0z
MiBkaXZpc2lvbnMgZXZlbiBpbiA2NGJpdCBwbGF0Zm9ybXMsIHRoaXMgcGF0Y2ggd2lsbAo+IG1v
dmUgaXQgdG8gZGl2NjRfdWwgbWFjcm8gdGhhdCB3aWxsIGRlY2lkZSB0aGUgY29ycmVjdAo+IGRp
dmlzaW9uIGZ1bmN0aW9uIGZvciB0aGUgcGxhdGZvcm0gdW5kZXJuZWF0aC4gVGhlIG91dHB1dAo+
IHRoZSB3YXJuaW5nIGZvbGxvd3M6Cj4gCj4gYXJjaC94ODYva3ZtL2xhcGljLmM6MTk0ODoxLTc6
IFdBUk5JTkc6IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZpc2lvbiwgcGxlYXNlIGNvbnNp
ZGVyIHVzaW5nIGRpdjY0X3VsIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVr
a2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQGZveGhvdW5kLmZpPgo+IC0tLQo+ICBhcmNoL3g4Ni9r
dm0vbGFwaWMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9sYXBpYy5jIGIvYXJjaC94
ODYva3ZtL2xhcGljLmMKPiBpbmRleCAzZTk3N2RiYmY5OTMuLjBiOTBjNmFkNTA5MSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3g4Ni9rdm0vbGFwaWMuYwo+ICsrKyBiL2FyY2gveDg2L2t2bS9sYXBpYy5j
Cj4gQEAgLTE5NDUsNyArMTk0NSw3IEBAIHN0YXRpYyB2b2lkIHN0YXJ0X3N3X3RzY2RlYWRsaW5l
KHN0cnVjdCBrdm1fbGFwaWMgKmFwaWMpCj4gIAlndWVzdF90c2MgPSBrdm1fcmVhZF9sMV90c2Mo
dmNwdSwgcmR0c2MoKSk7Cj4gIAo+ICAJbnMgPSAodHNjZGVhZGxpbmUgLSBndWVzdF90c2MpICog
MTAwMDAwMFVMTDsKPiAtCWRvX2RpdihucywgdGhpc190c2Nfa2h6KTsKPiArCWRpdjY0X3VsKG5z
LCB0aGlzX3RzY19raHopOwoKV2VsbCB0aGlzIGlzIHNpbGx5LCB2aXJ0dWFsX3RzY19raHogaXMg
YSB1MzIuCgoJdW5zaWduZWQgbG9uZyB0aGlzX3RzY19raHogPSB2Y3B1LT5hcmNoLnZpcnR1YWxf
dHNjX2toejsKCnN0cnVjdCBrdm1fdmNwdV9hcmNoIHsgCgoJLi4uCgoJdTMyIHZpcnR1YWxfdHNj
X2toejsKCn0KCkkgYXNzdW1lIHRoaXMgd2lsbCBtYWtlIGNvY2NpbmVsbGUgaGFwcHk/CgpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYva3ZtL2xhcGljLmMgYi9hcmNoL3g4Ni9rdm0vbGFwaWMuYwppbmRl
eCAyNDViMjA5NzNjYWUuLjMxZTljODRiODc5MSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2xh
cGljLmMKKysrIGIvYXJjaC94ODYva3ZtL2xhcGljLmMKQEAgLTE5MzIsNyArMTkzMiw3IEBAIHN0
YXRpYyB2b2lkIHN0YXJ0X3N3X3RzY2RlYWRsaW5lKHN0cnVjdCBrdm1fbGFwaWMgKmFwaWMpCiAg
ICAgICAgdTY0IG5zID0gMDsKICAgICAgICBrdGltZV90IGV4cGlyZTsKICAgICAgICBzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUgPSBhcGljLT52Y3B1OwotICAgICAgIHVuc2lnbmVkIGxvbmcgdGhpc190
c2Nfa2h6ID0gdmNwdS0+YXJjaC52aXJ0dWFsX3RzY19raHo7CisgICAgICAgdTMyIHRoaXNfdHNj
X2toeiA9IHZjcHUtPmFyY2gudmlydHVhbF90c2Nfa2h6OwogICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3M7CiAgICAgICAga3RpbWVfdCBub3c7CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApM
aW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50
ZWVzCg==
