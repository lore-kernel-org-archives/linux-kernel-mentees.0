Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208A3C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 May 2022 19:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A742E400DB;
	Wed, 25 May 2022 19:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2oblGm4T9-K; Wed, 25 May 2022 19:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D512D40AE7;
	Wed, 25 May 2022 19:26:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3EE6C0032;
	Wed, 25 May 2022 19:26:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 395B9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 19:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12CC440AE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 19:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbqYTOJyEMDr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 19:26:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DF85400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 19:26:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id y13so42881853eje.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 May 2022 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tutsg3cgw72wmrqbtZBQVz/JQ/jobeGiwbgCHZW5u7A=;
 b=YK0d8cE3KQzWL0uX7hSy9CKHWz+RqIIghl7QY5xscnB9xG3MUvp8o0YeGIjLk+7Onu
 y5BKfebA/m1AYl59W0E0ATiH0j+Uk1ZZ8fa25DqifL7w9OppsLRwtG1hnp1hYjx4yLST
 PCzvYXoNTok0UTCpsXKcPB4ELta+x0UAN1rgarIyRW/dqHJFCzuZPBPWQxaL+lh584Oj
 FnW22AJRyXmwiWejRBhRqtvor6+zZ5Pjwyu1nLYcDK96JmfDsAnxhhGU2FKjoe4EY3wh
 bIGspPWEfdJF6Q2YEq1Kzi/aO01zMEEnnmym968MPUA9+9sn/11sHI6EpowULfs9Qb/a
 uHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tutsg3cgw72wmrqbtZBQVz/JQ/jobeGiwbgCHZW5u7A=;
 b=YNa9ZptDbxmWuKUgLbJrcJWgcJq1bKYIaxIyhPupJMUMvqwc6+TCiobNlKtN8O1d/B
 JXSGtg5pYxftwn9ffGorMKtee8cIP+iLLrS+nuRZgWNaB2JpPv5qzF0s+9FRDP8/TnnY
 C13FZDrI+JYgchNFsSBg58Imn7MgvRWB84zp4BpJ6ukQ3aWtzfLXetIUTolG9irddrNQ
 Q1w7AwJvcRKIC3rH9KzgbGgQ1cdy6PRdt72+rkaahpKShpUjXPLC5QukTlM8+6ESDeYN
 LeSI2C4eJ8CvLbwT763Y7KwNeU45QuBfMonuSfKeT3R2DHO2p3eNBR6OA7YtrUKf5ce5
 HwlA==
X-Gm-Message-State: AOAM531E04DOYI6Rogb4SuJAaY3skpEcCYo3+G7wze9jDekpPepHEEap
 507oxUdD7oC+rv1NIJO5Gm5AOw==
X-Google-Smtp-Source: ABdhPJyxwQsdpAjuUCIdAz4hw4+sKgiHXE+r0RxNq3kM6PB8A9dVKXCNJKKc4oDCQ7h65u/pUGEeJg==
X-Received: by 2002:a17:907:7f14:b0:6ff:2013:3e98 with SMTP id
 qf20-20020a1709077f1400b006ff20133e98mr700315ejc.73.1653506782691; 
 Wed, 25 May 2022 12:26:22 -0700 (PDT)
Received: from ?IPV6:2003:d9:9706:da00:cfdc:6d78:4a00:8f2e?
 (p200300d99706da00cfdc6d784a008f2e.dip0.t-ipconnect.de.
 [2003:d9:9706:da00:cfdc:6d78:4a00:8f2e])
 by smtp.googlemail.com with ESMTPSA id
 15-20020a170906004f00b006f3ef214dd9sm8037973ejg.63.2022.05.25.12.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 12:26:21 -0700 (PDT)
Message-ID: <5dc3eb9d-229c-b086-9d1a-f695e94f8752@colorfullife.com>
Date: Wed, 25 May 2022 21:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ipc: Remove dead code in perform_atomic_semop()
Content-Language: en-US
To: Gautam Menghani <gautammenghani201@gmail.com>, akpm@linux-foundation.org, 
 shakeelb@google.com, vasily.averin@linux.dev, mhocko@suse.com
References: <20220524182244.42987-1-gautammenghani201@gmail.com>
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <20220524182244.42987-1-gautammenghani201@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gNS8yNC8yMiAyMDoyMiwgR2F1dGFtIE1lbmdoYW5pIHdyb3RlOgo+IFJlbW92ZSB0aGUgbGlu
ZSB3aGljaCBpcyBkZWFkIGNvZGUuIEZpeGVzIHRoZSBjbGFuZyBzY2FuIHdhcm5pbmc6Cj4gd2Fy
bmluZzogVmFsdWUgc3RvcmVkIHRvICdyZXN1bHQnIGlzIG5ldmVyIHJlYWQgW2RlYWRjb2RlLkRl
YWRTdG9yZXNdCj4gICAgICAgICAgICAgICAgICByZXN1bHQgPSBjdXJyLT5zZW12YWw7Cj4KPiBT
aWduZWQtb2ZmLWJ5OiBHYXV0YW0gTWVuZ2hhbmkgPGdhdXRhbW1lbmdoYW5pMjAxQGdtYWlsLmNv
bT4KUmV2aWV3ZWQtYnk6IE1hbmZyZWQgU3ByYXVsIDxtYW5mcmVkQGNvbG9yZnVsbGlmZS5jb20+
Cj4gLS0tCj4gICBpcGMvc2VtLmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvaXBjL3NlbS5jIGIvaXBjL3NlbS5jCj4gaW5kZXggMGRiZGI5
OGZkZjJkLi4xNTY4MjRiY2RhNDcgMTAwNjQ0Cj4gLS0tIGEvaXBjL3NlbS5jCj4gKysrIGIvaXBj
L3NlbS5jCj4gQEAgLTc2Niw3ICs3NjYsNiBAQCBzdGF0aWMgaW50IHBlcmZvcm1fYXRvbWljX3Nl
bW9wKHN0cnVjdCBzZW1fYXJyYXkgKnNtYSwgc3RydWN0IHNlbV9xdWV1ZSAqcSkKPiAgIAlmb3Ig
KHNvcCA9IHNvcHM7IHNvcCA8IHNvcHMgKyBuc29wczsgc29wKyspIHsKPiAgIAkJY3VyciA9ICZz
bWEtPnNlbXNbc29wLT5zZW1fbnVtXTsKPiAgIAkJc2VtX29wID0gc29wLT5zZW1fb3A7Cj4gLQkJ
cmVzdWx0ID0gY3Vyci0+c2VtdmFsOwo+ICAgCgpBIGNvcHkvcGFzdGUgbWlzdGFrZTogVGhlIDFz
dCBsb29wIGluIHBlcmZvcm1fYXRvbWljX3NlbW9wKCkgbmVlZHMgCnJlc3VsdCAtIGJlY2F1c2Ug
aXQgbXVzdCBjaGVjayBmb3Igb3ZlcmZsb3dzLgoKVGhlIDJuZCBsb29wIGRvZXNuJ3QgbmVlZCBp
dC4KCj4gICAJCWlmIChzb3AtPnNlbV9mbGcgJiBTRU1fVU5ETykgewo+ICAgCQkJaW50IHVuZG8g
PSB1bi0+c2VtYWRqW3NvcC0+c2VtX251bV0gLSBzZW1fb3A7CgotLQoKIMKgwqDCoCBNYW5mcmVk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
