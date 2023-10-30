Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005CCC4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 10:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 861E5852B7;
	Mon, 30 Oct 2023 10:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 861E5852B7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=f+ZdtjAO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O10RyDn9VO2X; Mon, 30 Oct 2023 10:10:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5E35D81E69;
	Mon, 30 Oct 2023 10:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E35D81E69
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 365D2C0039;
	Mon, 30 Oct 2023 10:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8F5EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 10:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1947851C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 10:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1947851C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7RfY2gJWbdwl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 10:10:37 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8687F81E69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 10:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8687F81E69
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso78685e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698660635; x=1699265435;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3zgy30RJ+D4CBrJvlTQXpMKazTmgNjyYtW3+p1yMKE=;
 b=f+ZdtjAO9+dlIX07omF8/MMDkAxhO4LNMiZ336WSdE1q4QpD3fHBtn4+5Ryza8avKo
 AuUd6eMdyGC9CHvFcvBpVQp2WwN6Jh0VIpIIlSIeD8edAbyn+GY+a7tvOirc35FyLEO/
 R6f//PTmxo+pChHesjfPnITprdJFvm0orX79nNJJfjpauSmSTwPSa9ThtwG32szNj1ax
 evdEWbnv3PSNpGcm5P2/mOHy/VMTo4XhqOR565b2tR9Ut2BaipwxFwFJ3dN3x8l0CjcQ
 1BBINOgSB/iC1FmdHMJpq4cABXmOwK5DprU1rvHZjdY/LIaVgk7HgOxL936+8WyCl8w8
 hq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698660635; x=1699265435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3zgy30RJ+D4CBrJvlTQXpMKazTmgNjyYtW3+p1yMKE=;
 b=RLYu7Yvds4hixdbHpcN8E/ele4lsdvfwflfEtdVrhkByk7rONmq3L71UzSe+/ArN5a
 C9rE9OLTuFlAUN51jBcls8QWqWYba3TVo5lM0KH7RXWS13HDbmtEGlUaMUsvkt61N6//
 T1UED28+lMKNkhAPz1XAKKLw9a+MEp83zM58XD8W6QcmwXZuKAtfOoEulwlD/4EJ7VPu
 0XkEAyWqenmHvq/3g/syw+vLi74Nh/G4pPoWdAq7xHFtQpSIS8EvVnO1gMukzARTYpU2
 zGkxRk4tazpo0rT4m1gBzf8JeH3Y4FQFa6xQRdFPa1aYLNis5DBaxqrH7jQqmkMxGJyw
 7eGA==
X-Gm-Message-State: AOJu0YxhB9jSjHgCLZFSDjwiNdy3LO9bSV3Svt/ylouf3UljmsL2dCR8
 YHz9dN4UQbc+eS6VVzw5BA6ACyMQQvvrcsXVRuOYnw==
X-Google-Smtp-Source: AGHT+IEx18gywoxoTCuRJl1RZx7vKGVb7LBy12SquWLHYEomOx12+8+oFG8e5WT78snujNUoacBz1xrMag4bb2IlSZE=
X-Received: by 2002:a05:600c:1d17:b0:400:c6de:6a20 with SMTP id
 l23-20020a05600c1d1700b00400c6de6a20mr92585wms.3.1698660635350; Mon, 30 Oct
 2023 03:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
 <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
 <VI1P193MB075221DDE87BE09A4E7CBB1A99A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB075221DDE87BE09A4E7CBB1A99A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 30 Oct 2023 11:10:22 +0100
Message-ID: <CACT4Y+bxMKEVUhu-RDvOMcbah=iYCWdXFZDU0JN3D7OP26Q_Dw@mail.gmail.com>
Subject: Re: [RFC] mm/kasan: Add Allocation, Free,
 Error timestamps to KASAN report
To: Juntong Deng <juntong.deng@outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Andrey Konovalov <andreyknvl@gmail.com>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gTW9uLCAzMCBPY3QgMjAyMyBhdCAxMDoyOCwgSnVudG9uZyBEZW5nIDxqdW50b25nLmRlbmdA
b3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMC8zMCAxNDoyOSwgRG1pdHJ5IFZ5dWtv
diB3cm90ZToKPiA+IE9uIFN1biwgMjkgT2N0IDIwMjMgYXQgMTA6MDUsIEp1bnRvbmcgRGVuZyA8
anVudG9uZy5kZW5nQG91dGxvb2suY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjMvMTAvMjYg
MzoyMiwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+Pj4gT24gVHVlLCBPY3QgMTcsIDIwMjMg
YXQgOTo0MOKAr1BNIEp1bnRvbmcgRGVuZyA8anVudG9uZy5kZW5nQG91dGxvb2suY29tPiB3cm90
ZToKPiA+Pj4+Cj4gPj4+PiBUaGUgaWRlYSBjYW1lIGZyb20gdGhlIGJ1ZyBJIHdhcyBmaXhpbmcg
cmVjZW50bHksCj4gPj4+PiAnS0FTQU46IHNsYWItdXNlLWFmdGVyLWZyZWUgUmVhZCBpbiB0bHNf
ZW5jcnlwdF9kb25lJy4KPiA+Pj4+Cj4gPj4+PiBUaGlzIGJ1ZyBpcyBjYXVzZWQgYnkgc3VidGxl
IHJhY2UgY29uZGl0aW9uLCB3aGVyZSB0aGUgZGF0YSBzdHJ1Y3R1cmUKPiA+Pj4+IGlzIGZyZWVk
IGVhcmx5IG9uIGFub3RoZXIgQ1BVLCByZXN1bHRpbmcgaW4gdXNlLWFmdGVyLWZyZWUuCj4gPj4+
Pgo+ID4+Pj4gTGlrZSB0aGlzIGJ1Zywgc29tZSBvZiB0aGUgdXNlLWFmdGVyLWZyZWUgYnVncyBh
cmUgY2F1c2VkIGJ5IHJhY2UKPiA+Pj4+IGNvbmRpdGlvbiwgYnV0IGl0IGlzIG5vdCBlYXN5IHRv
IHF1aWNrbHkgY29uY2x1ZGUgdGhhdCB0aGUgY2F1c2Ugb2YgdGhlCj4gPj4+PiB1c2UtYWZ0ZXIt
ZnJlZSBpcyByYWNlIGNvbmRpdGlvbiBpZiBvbmx5IGxvb2tpbmcgYXQgdGhlIHN0YWNrIHRyYWNl
Lgo+ID4+Pj4KPiA+Pj4+IEkgZGlkIG5vdCB0aGluayB0aGlzIHVzZS1hZnRlci1mcmVlIHdhcyBj
YXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYXQgdGhlCj4gPj4+PiBiZWdpbm5pbmcsIGl0IHRvb2sg
bWUgc29tZSB0aW1lIHRvIHJlYWQgdGhlIHNvdXJjZSBjb2RlIGNhcmVmdWxseSBhbmQKPiA+Pj4+
IHRoaW5rIGFib3V0IGl0IHRvIGRldGVybWluZSB0aGF0IGl0IHdhcyBjYXVzZWQgYnkgcmFjZSBj
b25kaXRpb24uCj4gPj4+Pgo+ID4+Pj4gQnkgYWRkaW5nIHRpbWVzdGFtcHMgZm9yIEFsbG9jYXRp
b24sIEZyZWUsIGFuZCBFcnJvciB0byB0aGUgS0FTQU4KPiA+Pj4+IHJlcG9ydCwgaXQgd2lsbCBi
ZSBtdWNoIGVhc2llciB0byBkZXRlcm1pbmUgaWYgdXNlLWFmdGVyLWZyZWUgaXMKPiA+Pj4+IGNh
dXNlZCBieSByYWNlIGNvbmRpdGlvbi4KPiA+Pj4KPiA+Pj4gQW4gYWx0ZXJuYXRpdmUgd291bGQg
YmUgdG8gYWRkIHRoZSBDUFUgbnVtYmVyIHRvIHRoZSBhbGxvYy9mcmVlIHN0YWNrCj4gPj4+IHRy
YWNlcy4gU29tZXRoaW5nIGxpa2U6Cj4gPj4+Cj4gPj4+IEFsbG9jYXRlZCBieSB0YXNrIDQyIG9u
IENQVSAyOgo+ID4+PiAoc3RhY2sgdHJhY2UpCj4gPj4+Cj4gPj4+IFRoZSBiYWQgYWNjZXNzIHN0
YWNrIHRyYWNlIGFscmVhZHkgcHJpbnRzIHRoZSBDUFUgbnVtYmVyLgo+ID4+Cj4gPj4gWWVzLCB0
aGF0IGlzIGEgZ3JlYXQgaWRlYSBhbmQgdGhlIENQVSBudW1iZXIgd291bGQgaGVscCBhIGxvdC4K
PiA+Pgo+ID4+IEJ1dCBJIHRoaW5rIHRoZSBDUFUgbnVtYmVyIGNhbm5vdCBjb21wbGV0ZWx5IHJl
cGxhY2UgdGhlIGZyZWUgdGltZXN0YW1wLAo+ID4+IGJlY2F1c2Ugc29tZSBmcmVlaW5nIHJlYWxs
eSBzaG91bGQgYmUgZG9uZSBhdCBhbm90aGVyIENQVS4KPiA+Pgo+ID4+IFdlIG5lZWQgdGhlIGZy
ZWUgdGltZXN0YW1wIHRvIGhlbHAgdXMgZGlzdGluZ3Vpc2ggd2hldGhlciBpdCB3YXMgZnJlZWQK
PiA+PiBhIGxvbmcgdGltZSBhZ28gb3Igd2hldGhlciBpdCB3YXMgY2F1c2VkIHRvIGJlIGZyZWVk
IGR1cmluZyB0aGUKPiA+PiBjdXJyZW50IG9wZXJhdGlvbi4KPiA+Pgo+ID4+IEkgdGhpbmsgYm90
aCB0aGUgQ1BVIG51bWJlciBhbmQgdGhlIHRpbWVzdGFtcCBzaG91bGQgYmUgZGlzcGxheWVkLCBt
b3JlCj4gPj4gaW5mb3JtYXRpb24gd291bGQgaGVscCB1cyBmaW5kIHRoZSByZWFsIGNhdXNlIG9m
IHRoZSBlcnJvciBmYXN0ZXIuCj4gPj4KPiA+PiBTaG91bGQgSSBpbXBsZW1lbnQgdGhlc2UgZmVh
dHVyZXM/Cj4gPgo+ID4gSGkgSnVudG9uZywKPiA+Cj4gPiBUaGVyZSBpcyBhbHNvIGFuIGFzcGVj
dCBvZiBtZW1vcnkgY29uc3VtcHRpb24uIEtBU0FOIGhlYWRlcnMgaW5jcmVhc2UKPiA+IHRoZSBz
aXplIG9mIGV2ZXJ5IGhlYXAgb2JqZWN0LiBTbyB3ZSB0cmllZCB0byBrZWVwIHRoZW0gYXMgY29t
cGFjdCBhcwo+ID4gcG9zc2libGUuIEF0IHNvbWUgcG9pbnQgQ1BVIG51bWJlcnMgYW5kIHRpbWVz
dGFtcHMgKElJUkMpIHdlcmUgYWxyZWFkeQo+ID4gcGFydCBvZiB0aGUgaGVhZGVyLCBidXQgd2Ug
cmVtb3ZlZCB0aGVtIHRvIHNocmluayB0aGUgaGVhZGVyIHRvIDE2Cj4gPiBieXRlcy4KPiA+IFBJ
RCBnaXZlcyBhIGdvb2QgYXBwcm94aW1hdGlvbiBvZiBwb3RlbnRpYWwgcmFjZXMuIEkgdXN1YWxs
eSBsb29rIGF0Cj4gPiBQSURzIHRvIHVuZGVyc3RhbmQgaWYgaXQncyBhICJwbGFpbiBvbGQgc2lu
Z2xlLXRocmVhZGVkCj4gPiB1c2UtYWZ0ZXItZnJlZSIsIG9yIGZyZWUgYW5kIGFjY2VzcyBoYXBw
ZW5lZCBpbiBkaWZmZXJlbnQgdGhyZWFkcy4KPiA+IFJlIHRpbWVzdGFtcHMsIEkgc2VlIHlvdSBy
ZWZlcmVuY2VkIGEgc3l6Ym90IHJlcG9ydC4gV2l0aCBzeXprYWxsZXIKPiA+IG1vc3QgdGltZXN0
YW1wcyB3aWxsIGJlIHZlcnkgY2xvc2UgZXZlbiBmb3Igbm9uLXJhY2luZyBjYXNlLgo+ID4gU28g
aWYgdGhpcyBpcyBhZGRlZCwgdGhpcyBzaG91bGQgYmUgYWRkZWQgYXQgbGVhc3QgdW5kZXIgYSBz
ZXBhcmF0ZSBjb25maWcuCj4gPgo+ID4gSWYgeW91IGFyZSBsb29raW5nIGZvciBwb3RlbnRpYWwg
S0FTQU4gaW1wcm92ZW1lbnRzLCBoZXJlIGlzIGEgZ29vZCBsaXN0Ogo+ID4gaHR0cHM6Ly9idWd6
aWxsYS5rZXJuZWwub3JnL2J1Z2xpc3QuY2dpP2J1Z19zdGF0dXM9X19vcGVuX18mY29tcG9uZW50
PVNhbml0aXplcnMmbGlzdF9pZD0xMTM0MTY4JnByb2R1Y3Q9TWVtb3J5JTIwTWFuYWdlbWVudAo+
Cj4gSGkgRG1pdHJ5LAo+Cj4gSSB0aGluayBQSUQgY2Fubm90IGNvbXBsZXRlbHkgcmVwbGFjZSB0
aW1lc3RhbXAgZm9yIHJlYXNvbiBzaW1pbGFyIHRvCj4gQ1BVIG51bWJlciwgc29tZSBmcmVlcyBy
ZWFsbHkgc2hvdWxkIGJlIGRvbmUgaW4gYW5vdGhlciB0aHJlYWQsIGJ1dCBpdAo+IGlzIGRpZmZp
Y3VsdCBmb3IgdXMgdG8gZGlzdGluZ3Vpc2ggaWYgaXQgaXMgYSBmcmVlIHRoYXQgd2FzIGRvbmUg
c29tZQo+IHRpbWUgYWdvLCBvciB1bmRlciBzdWJ0bGUgcmFjZSBjb25kaXRpb25zLgoKSSBhZ3Jl
ZSBpdCdzIG5vdCBhIGNvbXBsZXRlIHJlcGxhY2VtZW50LCBpdCBqdXN0IGRvZXMgbm90IGNvbnN1
bWUKYWRkaXRpb25hbCBtZW1vcnkuCgo+IEFzIHRvIHdoZXRoZXIgbW9zdCBvZiB0aGUgdGltZXN0
YW1wcyB3aWxsIGJlIHZlcnkgY2xvc2UgZXZlbiBmb3IKPiBub24tcmFjaW5nIGNhc2UsIHRoaXMg
SSBhbSBub3Qgc3VyZSwgYmVjYXVzZSBJIGRvIG5vdCBoYXZlCj4gZW5vdWdoIHNhbXBsZXMuCj4K
PiBJIGFncmVlIHRoYXQgdGhlc2UgZmVhdHVyZXMgc2hvdWxkIGJlIGluIGEgc2VwYXJhdGUgY29u
ZmlnIGFuZAo+IHRoZSB1c2VyIHNob3VsZCBiZSBmcmVlIHRvIGNob29zZSB3aGV0aGVyIHRvIGVu
YWJsZSB0aGVtIG9yIG5vdC4KPgo+IFdlIGNhbiBkaXZpZGUgS0FTQU4gaW50byBub3JtYWwgbW9k
ZSBhbmQgZGVwdGggbW9kZS4gTm9ybWFsIG1vZGUKPiByZWNvcmRzIG9ubHkgbWluaW1hbCBjcml0
aWNhbCBpbmZvcm1hdGlvbiwgd2hpbGUgZGVwdGggbW9kZSByZWNvcmRzCj4gbW9yZSBwb3RlbnRp
YWxseSB1c2VmdWwgaW5mb3JtYXRpb24uCj4KPiBBbHNvLCBob25lc3RseSwgSSB0aGluayBhIHNt
YWxsIGFtb3VudCBvZiBleHRyYSBtZW1vcnkgY29uc3VtcHRpb24KPiBzaG91bGQgbm90IHN0b3Ag
dXMgZnJvbSByZWNvcmRpbmcgbW9yZSBpbmZvcm1hdGlvbi4KPgo+IEJlY2F1c2UgaWYgc29tZW9u
ZSBlbmFibGVzIEtBU0FOIGZvciBkZWJ1Z2dpbmcsIHRoZW4gbWVtb3J5IGNvbnN1bXB0aW9uCj4g
YW5kIHBlcmZvcm1hbmNlIGFyZSBubyBsb25nZXIgaGlzIG1haW4gY29uY2Vybi4KClRoZXJlIGFy
ZSBhIG51bWJlciBvZiBkZWJ1Z2dpbmcgdG9vbHMgY3JlYXRlZCB3aXRoIHRoZSAicGVyZm9ybWFu
Y2UKZG9lcyBub3QgbWF0dGVyIiBhdHRpdHVkZS4gVGhleSB0ZW5kIHRvIGJlIGJhcmVseSB1c2Fi
bGUsIG5vdCB1c2FibGUKaW4gd2lkZSBzY2FsZSB0ZXN0aW5nLCBub3QgdXNhYmxlIGluIGNhbmFy
aWVzLCBldGMuCkFsbCBvZiBzYW5pdGl6ZXJzIHdlcmUgY3JlYXRlZCB3aXRoIGxvdHMgb2YgYXR0
ZW50aW9uIHRvIHBlcmZvcm1hbmNlLAphdHRlbnRpb24gb24gdGhlIGxldmVsIG9mIHRoZSBtb3N0
IHBlcmZvcm1hbmNlIGNyaXRpY2FsIHByb2R1Y3Rpb24KY29kZSAoc2FuaXRpemVyIGNvZGUgaXMg
aG90dGVyIHRoYW4gYW55IHByb2R1Y3Rpb24gcGllY2Ugb2YgY29kZSkuClRoYXQncyB3aGF0IG1h
ZGUgdGhlbSBzbyB3aWRlbHkgdXNlZC4gVGhpbmsgb2YgaW50ZXJhY3RpdmUgdXNlcywKc21hbGxl
ciBkZXZpY2VzLCBldGMuIFBsZWFzZSBsZXQncyBrZWVwIHRoaXMgYXR0aXR1ZGUuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50
ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
