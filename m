Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF5AC25B6B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 19:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4050080F76;
	Wed, 25 Oct 2023 19:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4050080F76
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UPVFmxMX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUDC0qVY5_0n; Wed, 25 Oct 2023 19:23:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8C08680072;
	Wed, 25 Oct 2023 19:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C08680072
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69F4AC0039;
	Wed, 25 Oct 2023 19:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE3ABC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6CE560B5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CE560B5C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UPVFmxMX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id De0EKKXIe6a5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:23:05 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DD7660B1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD7660B1A
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5b8f68ba4e5so121294a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698261784; x=1698866584;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m31BwFRcj7ARX8+GTG5pwS7sZOyZiRPn3jP/pVTMYz0=;
 b=UPVFmxMXh5UNW7yLjJYfeSvzuZ4kcnQ0Z+Z1EE/w0laG7bwv1KpHwRUeRxARnCV3Fy
 rE4vK/6Tq/e+8SOzxfTWmUhIeipvL8r6p80vrVnrVeKoNwR2JAIRbYNfz6eMan8ytrPF
 BSyuH34F5CSWTI3t5EyXgIdaPV7aFavKi1UTe/hvLLJ2r18IT0niAFzEPSdeBKR4jI/D
 +jDKiG6XN+aVY6VxbQKyvQHzqWjH6M8ixrJqyAB4m08PJU0FEfIfafmm4YoDzWt3hjea
 oS2WyF2XuHBA3lt4BOe6JfGtTiybEnCAuHIBbcoe+uGscykCCGP2qiZvzTAuF8MD8YSX
 fQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698261784; x=1698866584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m31BwFRcj7ARX8+GTG5pwS7sZOyZiRPn3jP/pVTMYz0=;
 b=kPUa9RpbreS68X3BbYbAYTs3W5AJKDbtW2+kNWxXRbRMKOsH8OOUXY+RCtxuu1Aj3c
 /DWIHGEEG8KLQhwuoSzpcIsWXaciy9rQGCZwBt53jsgNcUTx+DIS+rAQyeK2bXTYTwhn
 AXDoZlglbeh25x2PZs3mJhVx9BMVf7QbEAy8ojphauFGd4vTPefFqVVh1Z7O8IW8Mj9o
 2cD0a6r/puWhtFgbgEgyGIYOLmJz0Sk8n7hDqsOEMYVrZqNiZJDEh/M0cwIxjqGOCN9f
 EHj3acOqQQvoiWwemQN6rREYZi5aFhVR2aChv1RtKv3PhNu3ix02Zs+lIDvussgmoxP/
 tUNA==
X-Gm-Message-State: AOJu0YzFz6MGrVzIHooqDwVt8dE/aG9yscd9XwmvWlhZKM4FPwrKNiH7
 qp1T2uf/W/01cmRmUR480L/3DgY0W7HXktq3UUo=
X-Google-Smtp-Source: AGHT+IEXkPuONFu7qOjHo6srCclNtmMeCXeOu/J8zGOvFhjtxKftxqmyNPajTQ0aexxNZJvaOT4TbzjJShoyZqEa0b0=
X-Received: by 2002:a17:90b:1b49:b0:27d:4513:9c99 with SMTP id
 nv9-20020a17090b1b4900b0027d45139c99mr14243752pjb.17.1698261784445; Wed, 25
 Oct 2023 12:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 25 Oct 2023 21:22:53 +0200
Message-ID: <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
Subject: Re: [RFC] mm/kasan: Add Allocation, Free,
 Error timestamps to KASAN report
To: Juntong Deng <juntong.deng@outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, dvyukov@google.com
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgOTo0MOKAr1BNIEp1bnRvbmcgRGVuZyA8anVudG9uZy5k
ZW5nQG91dGxvb2suY29tPiB3cm90ZToKPgo+IFRoZSBpZGVhIGNhbWUgZnJvbSB0aGUgYnVnIEkg
d2FzIGZpeGluZyByZWNlbnRseSwKPiAnS0FTQU46IHNsYWItdXNlLWFmdGVyLWZyZWUgUmVhZCBp
biB0bHNfZW5jcnlwdF9kb25lJy4KPgo+IFRoaXMgYnVnIGlzIGNhdXNlZCBieSBzdWJ0bGUgcmFj
ZSBjb25kaXRpb24sIHdoZXJlIHRoZSBkYXRhIHN0cnVjdHVyZQo+IGlzIGZyZWVkIGVhcmx5IG9u
IGFub3RoZXIgQ1BVLCByZXN1bHRpbmcgaW4gdXNlLWFmdGVyLWZyZWUuCj4KPiBMaWtlIHRoaXMg
YnVnLCBzb21lIG9mIHRoZSB1c2UtYWZ0ZXItZnJlZSBidWdzIGFyZSBjYXVzZWQgYnkgcmFjZQo+
IGNvbmRpdGlvbiwgYnV0IGl0IGlzIG5vdCBlYXN5IHRvIHF1aWNrbHkgY29uY2x1ZGUgdGhhdCB0
aGUgY2F1c2Ugb2YgdGhlCj4gdXNlLWFmdGVyLWZyZWUgaXMgcmFjZSBjb25kaXRpb24gaWYgb25s
eSBsb29raW5nIGF0IHRoZSBzdGFjayB0cmFjZS4KPgo+IEkgZGlkIG5vdCB0aGluayB0aGlzIHVz
ZS1hZnRlci1mcmVlIHdhcyBjYXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYXQgdGhlCj4gYmVnaW5u
aW5nLCBpdCB0b29rIG1lIHNvbWUgdGltZSB0byByZWFkIHRoZSBzb3VyY2UgY29kZSBjYXJlZnVs
bHkgYW5kCj4gdGhpbmsgYWJvdXQgaXQgdG8gZGV0ZXJtaW5lIHRoYXQgaXQgd2FzIGNhdXNlZCBi
eSByYWNlIGNvbmRpdGlvbi4KPgo+IEJ5IGFkZGluZyB0aW1lc3RhbXBzIGZvciBBbGxvY2F0aW9u
LCBGcmVlLCBhbmQgRXJyb3IgdG8gdGhlIEtBU0FOCj4gcmVwb3J0LCBpdCB3aWxsIGJlIG11Y2gg
ZWFzaWVyIHRvIGRldGVybWluZSBpZiB1c2UtYWZ0ZXItZnJlZSBpcwo+IGNhdXNlZCBieSByYWNl
IGNvbmRpdGlvbi4KCkFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGFkZCB0aGUgQ1BVIG51bWJl
ciB0byB0aGUgYWxsb2MvZnJlZSBzdGFjawp0cmFjZXMuIFNvbWV0aGluZyBsaWtlOgoKQWxsb2Nh
dGVkIGJ5IHRhc2sgNDIgb24gQ1BVIDI6CihzdGFjayB0cmFjZSkKClRoZSBiYWQgYWNjZXNzIHN0
YWNrIHRyYWNlIGFscmVhZHkgcHJpbnRzIHRoZSBDUFUgbnVtYmVyLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWls
aW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1r
ZXJuZWwtbWVudGVlcwo=
