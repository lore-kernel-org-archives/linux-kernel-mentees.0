Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C290C4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 09:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D38A9818EC;
	Tue, 31 Oct 2023 09:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38A9818EC
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nmuuGICK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ID6P966u2EE0; Tue, 31 Oct 2023 09:46:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A4D218194C;
	Tue, 31 Oct 2023 09:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D218194C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70377C0039;
	Tue, 31 Oct 2023 09:46:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E612C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 09:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67CB38194C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 09:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CB38194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozd2eRVYaMAa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 09:46:22 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0335E818EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 09:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0335E818EC
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so11447a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698745580; x=1699350380;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTxwVslDLW3XYJPo7d6erwK3L6Z/wP0aOPPJa5+jpt4=;
 b=nmuuGICKI4bZJbyfhFJbiHHAH1migW2Rdoni/C0YVBdK6xkKbs8MmDqZyZhL4xUvZP
 lxAQSr0cju7aEppUKH/1aT5I7rf4KtdKHvovPqI3ufg8vKemFqndm5hqE1cfwQxarD/x
 M+IudhIkk+FIPYUiXHLge9eOUstVp1B6u8Us33rR3AyZ0yLbBdf29Fcr3JV3aPOmRvjx
 QD4EFmbgYImRFXRRdFMWEMYUITb1Pe426rp4nIQJGB8eOO11Lnz9ztaIUezXoDNwq4Ki
 tK7Si92g3oOWtkVkrxWZChIv0Wkxykqpvk710IYLfKWZFIBSVKnDNsqD+7+ezJZCGW5b
 mVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698745580; x=1699350380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTxwVslDLW3XYJPo7d6erwK3L6Z/wP0aOPPJa5+jpt4=;
 b=MH45/olyhyictDejrsf77L/r02RqzCXuohu8yDiaexG5PHdK3U1/Os0nnh3a86oR0f
 dRfmzs7UDWnV9Ye+HTo9T/YhpQZZLgsDOnCozJAsj2X3QO9ebVGp93AYFQZRlLrMWaLt
 Vqn8Ufpf+ptwnMSCsvgG2ozpqnjtbzlN/MDQGMATcFwP3s0cptguR8+4G6ELEjnHfk/m
 KvKKyroEQy2AiPjNDA417fjaIJblGwuMJK7wtIOTpIB6Gp2tLjNGoLI7HCJ9yJeXDk/3
 8sKFphVAN1CHPzdruIIETebUzDswJnhX3NvaGANXPVz+zDiiVc6sd6T9IMpGKdDFz2kw
 7Ssw==
X-Gm-Message-State: AOJu0YwZZn/pNDFRj5l4zUzmWmna0dQPPMkkdZDXOuXbm+GrBV9DIhs+
 sQj+HMhkWk5c7rVGVUx5EJP3aXTYKa90WX36qel0Ng==
X-Google-Smtp-Source: AGHT+IGN3mM2N+nqhUvVo2QBdU6T2kfKp/GcVG7fysFgfPGginW9R/mMZndp5Wgf1dH9dRq0NT6zzHwUQrAg7PXbjGQ=
X-Received: by 2002:a50:d514:0:b0:543:3f97:aa0f with SMTP id
 u20-20020a50d514000000b005433f97aa0fmr77047edi.4.1698745579834; Tue, 31 Oct
 2023 02:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
 <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
 <VI1P193MB075221DDE87BE09A4E7CBB1A99A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+bxMKEVUhu-RDvOMcbah=iYCWdXFZDU0JN3D7OP26Q_Dw@mail.gmail.com>
 <VI1P193MB0752753CB059C9A4420C875799A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752753CB059C9A4420C875799A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Tue, 31 Oct 2023 10:46:07 +0100
Message-ID: <CACT4Y+ZS5cz9wZgxLVo2EsGtt-tkFXkFPA6CGAA8Gy7+sEyDUQ@mail.gmail.com>
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

T24gTW9uLCAzMCBPY3QgMjAyMyBhdCAxMjozMiwgSnVudG9uZyBEZW5nIDxqdW50b25nLmRlbmdA
b3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMC8zMCAxODoxMCwgRG1pdHJ5IFZ5dWtv
diB3cm90ZToKPiA+IE9uIE1vbiwgMzAgT2N0IDIwMjMgYXQgMTA6MjgsIEp1bnRvbmcgRGVuZyA8
anVudG9uZy5kZW5nQG91dGxvb2suY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjMvMTAvMzAg
MTQ6MjksIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4gPj4+IE9uIFN1biwgMjkgT2N0IDIwMjMgYXQg
MTA6MDUsIEp1bnRvbmcgRGVuZyA8anVudG9uZy5kZW5nQG91dGxvb2suY29tPiB3cm90ZToKPiA+
Pj4+Cj4gPj4+PiBPbiAyMDIzLzEwLzI2IDM6MjIsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4g
Pj4+Pj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgOTo0MOKAr1BNIEp1bnRvbmcgRGVuZyA8anVu
dG9uZy5kZW5nQG91dGxvb2suY29tPiB3cm90ZToKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhlIGlkZWEg
Y2FtZSBmcm9tIHRoZSBidWcgSSB3YXMgZml4aW5nIHJlY2VudGx5LAo+ID4+Pj4+PiAnS0FTQU46
IHNsYWItdXNlLWFmdGVyLWZyZWUgUmVhZCBpbiB0bHNfZW5jcnlwdF9kb25lJy4KPiA+Pj4+Pj4K
PiA+Pj4+Pj4gVGhpcyBidWcgaXMgY2F1c2VkIGJ5IHN1YnRsZSByYWNlIGNvbmRpdGlvbiwgd2hl
cmUgdGhlIGRhdGEgc3RydWN0dXJlCj4gPj4+Pj4+IGlzIGZyZWVkIGVhcmx5IG9uIGFub3RoZXIg
Q1BVLCByZXN1bHRpbmcgaW4gdXNlLWFmdGVyLWZyZWUuCj4gPj4+Pj4+Cj4gPj4+Pj4+IExpa2Ug
dGhpcyBidWcsIHNvbWUgb2YgdGhlIHVzZS1hZnRlci1mcmVlIGJ1Z3MgYXJlIGNhdXNlZCBieSBy
YWNlCj4gPj4+Pj4+IGNvbmRpdGlvbiwgYnV0IGl0IGlzIG5vdCBlYXN5IHRvIHF1aWNrbHkgY29u
Y2x1ZGUgdGhhdCB0aGUgY2F1c2Ugb2YgdGhlCj4gPj4+Pj4+IHVzZS1hZnRlci1mcmVlIGlzIHJh
Y2UgY29uZGl0aW9uIGlmIG9ubHkgbG9va2luZyBhdCB0aGUgc3RhY2sgdHJhY2UuCj4gPj4+Pj4+
Cj4gPj4+Pj4+IEkgZGlkIG5vdCB0aGluayB0aGlzIHVzZS1hZnRlci1mcmVlIHdhcyBjYXVzZWQg
YnkgcmFjZSBjb25kaXRpb24gYXQgdGhlCj4gPj4+Pj4+IGJlZ2lubmluZywgaXQgdG9vayBtZSBz
b21lIHRpbWUgdG8gcmVhZCB0aGUgc291cmNlIGNvZGUgY2FyZWZ1bGx5IGFuZAo+ID4+Pj4+PiB0
aGluayBhYm91dCBpdCB0byBkZXRlcm1pbmUgdGhhdCBpdCB3YXMgY2F1c2VkIGJ5IHJhY2UgY29u
ZGl0aW9uLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBCeSBhZGRpbmcgdGltZXN0YW1wcyBmb3IgQWxsb2Nh
dGlvbiwgRnJlZSwgYW5kIEVycm9yIHRvIHRoZSBLQVNBTgo+ID4+Pj4+PiByZXBvcnQsIGl0IHdp
bGwgYmUgbXVjaCBlYXNpZXIgdG8gZGV0ZXJtaW5lIGlmIHVzZS1hZnRlci1mcmVlIGlzCj4gPj4+
Pj4+IGNhdXNlZCBieSByYWNlIGNvbmRpdGlvbi4KPiA+Pj4+Pgo+ID4+Pj4+IEFuIGFsdGVybmF0
aXZlIHdvdWxkIGJlIHRvIGFkZCB0aGUgQ1BVIG51bWJlciB0byB0aGUgYWxsb2MvZnJlZSBzdGFj
awo+ID4+Pj4+IHRyYWNlcy4gU29tZXRoaW5nIGxpa2U6Cj4gPj4+Pj4KPiA+Pj4+PiBBbGxvY2F0
ZWQgYnkgdGFzayA0MiBvbiBDUFUgMjoKPiA+Pj4+PiAoc3RhY2sgdHJhY2UpCj4gPj4+Pj4KPiA+
Pj4+PiBUaGUgYmFkIGFjY2VzcyBzdGFjayB0cmFjZSBhbHJlYWR5IHByaW50cyB0aGUgQ1BVIG51
bWJlci4KPiA+Pj4+Cj4gPj4+PiBZZXMsIHRoYXQgaXMgYSBncmVhdCBpZGVhIGFuZCB0aGUgQ1BV
IG51bWJlciB3b3VsZCBoZWxwIGEgbG90Lgo+ID4+Pj4KPiA+Pj4+IEJ1dCBJIHRoaW5rIHRoZSBD
UFUgbnVtYmVyIGNhbm5vdCBjb21wbGV0ZWx5IHJlcGxhY2UgdGhlIGZyZWUgdGltZXN0YW1wLAo+
ID4+Pj4gYmVjYXVzZSBzb21lIGZyZWVpbmcgcmVhbGx5IHNob3VsZCBiZSBkb25lIGF0IGFub3Ro
ZXIgQ1BVLgo+ID4+Pj4KPiA+Pj4+IFdlIG5lZWQgdGhlIGZyZWUgdGltZXN0YW1wIHRvIGhlbHAg
dXMgZGlzdGluZ3Vpc2ggd2hldGhlciBpdCB3YXMgZnJlZWQKPiA+Pj4+IGEgbG9uZyB0aW1lIGFn
byBvciB3aGV0aGVyIGl0IHdhcyBjYXVzZWQgdG8gYmUgZnJlZWQgZHVyaW5nIHRoZQo+ID4+Pj4g
Y3VycmVudCBvcGVyYXRpb24uCj4gPj4+Pgo+ID4+Pj4gSSB0aGluayBib3RoIHRoZSBDUFUgbnVt
YmVyIGFuZCB0aGUgdGltZXN0YW1wIHNob3VsZCBiZSBkaXNwbGF5ZWQsIG1vcmUKPiA+Pj4+IGlu
Zm9ybWF0aW9uIHdvdWxkIGhlbHAgdXMgZmluZCB0aGUgcmVhbCBjYXVzZSBvZiB0aGUgZXJyb3Ig
ZmFzdGVyLgo+ID4+Pj4KPiA+Pj4+IFNob3VsZCBJIGltcGxlbWVudCB0aGVzZSBmZWF0dXJlcz8K
PiA+Pj4KPiA+Pj4gSGkgSnVudG9uZywKPiA+Pj4KPiA+Pj4gVGhlcmUgaXMgYWxzbyBhbiBhc3Bl
Y3Qgb2YgbWVtb3J5IGNvbnN1bXB0aW9uLiBLQVNBTiBoZWFkZXJzIGluY3JlYXNlCj4gPj4+IHRo
ZSBzaXplIG9mIGV2ZXJ5IGhlYXAgb2JqZWN0LiBTbyB3ZSB0cmllZCB0byBrZWVwIHRoZW0gYXMg
Y29tcGFjdCBhcwo+ID4+PiBwb3NzaWJsZS4gQXQgc29tZSBwb2ludCBDUFUgbnVtYmVycyBhbmQg
dGltZXN0YW1wcyAoSUlSQykgd2VyZSBhbHJlYWR5Cj4gPj4+IHBhcnQgb2YgdGhlIGhlYWRlciwg
YnV0IHdlIHJlbW92ZWQgdGhlbSB0byBzaHJpbmsgdGhlIGhlYWRlciB0byAxNgo+ID4+PiBieXRl
cy4KPiA+Pj4gUElEIGdpdmVzIGEgZ29vZCBhcHByb3hpbWF0aW9uIG9mIHBvdGVudGlhbCByYWNl
cy4gSSB1c3VhbGx5IGxvb2sgYXQKPiA+Pj4gUElEcyB0byB1bmRlcnN0YW5kIGlmIGl0J3MgYSAi
cGxhaW4gb2xkIHNpbmdsZS10aHJlYWRlZAo+ID4+PiB1c2UtYWZ0ZXItZnJlZSIsIG9yIGZyZWUg
YW5kIGFjY2VzcyBoYXBwZW5lZCBpbiBkaWZmZXJlbnQgdGhyZWFkcy4KPiA+Pj4gUmUgdGltZXN0
YW1wcywgSSBzZWUgeW91IHJlZmVyZW5jZWQgYSBzeXpib3QgcmVwb3J0LiBXaXRoIHN5emthbGxl
cgo+ID4+PiBtb3N0IHRpbWVzdGFtcHMgd2lsbCBiZSB2ZXJ5IGNsb3NlIGV2ZW4gZm9yIG5vbi1y
YWNpbmcgY2FzZS4KPiA+Pj4gU28gaWYgdGhpcyBpcyBhZGRlZCwgdGhpcyBzaG91bGQgYmUgYWRk
ZWQgYXQgbGVhc3QgdW5kZXIgYSBzZXBhcmF0ZSBjb25maWcuCj4gPj4+Cj4gPj4+IElmIHlvdSBh
cmUgbG9va2luZyBmb3IgcG90ZW50aWFsIEtBU0FOIGltcHJvdmVtZW50cywgaGVyZSBpcyBhIGdv
b2QgbGlzdDoKPiA+Pj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2J1Z2xpc3QuY2dpP2J1
Z19zdGF0dXM9X19vcGVuX18mY29tcG9uZW50PVNhbml0aXplcnMmbGlzdF9pZD0xMTM0MTY4JnBy
b2R1Y3Q9TWVtb3J5JTIwTWFuYWdlbWVudAo+ID4+Cj4gPj4gSGkgRG1pdHJ5LAo+ID4+Cj4gPj4g
SSB0aGluayBQSUQgY2Fubm90IGNvbXBsZXRlbHkgcmVwbGFjZSB0aW1lc3RhbXAgZm9yIHJlYXNv
biBzaW1pbGFyIHRvCj4gPj4gQ1BVIG51bWJlciwgc29tZSBmcmVlcyByZWFsbHkgc2hvdWxkIGJl
IGRvbmUgaW4gYW5vdGhlciB0aHJlYWQsIGJ1dCBpdAo+ID4+IGlzIGRpZmZpY3VsdCBmb3IgdXMg
dG8gZGlzdGluZ3Vpc2ggaWYgaXQgaXMgYSBmcmVlIHRoYXQgd2FzIGRvbmUgc29tZQo+ID4+IHRp
bWUgYWdvLCBvciB1bmRlciBzdWJ0bGUgcmFjZSBjb25kaXRpb25zLgo+ID4KPiA+IEkgYWdyZWUg
aXQncyBub3QgYSBjb21wbGV0ZSByZXBsYWNlbWVudCwgaXQganVzdCBkb2VzIG5vdCBjb25zdW1l
Cj4gPiBhZGRpdGlvbmFsIG1lbW9yeS4KPiA+Cj4gPj4gQXMgdG8gd2hldGhlciBtb3N0IG9mIHRo
ZSB0aW1lc3RhbXBzIHdpbGwgYmUgdmVyeSBjbG9zZSBldmVuIGZvcgo+ID4+IG5vbi1yYWNpbmcg
Y2FzZSwgdGhpcyBJIGFtIG5vdCBzdXJlLCBiZWNhdXNlIEkgZG8gbm90IGhhdmUKPiA+PiBlbm91
Z2ggc2FtcGxlcy4KPiA+Pgo+ID4+IEkgYWdyZWUgdGhhdCB0aGVzZSBmZWF0dXJlcyBzaG91bGQg
YmUgaW4gYSBzZXBhcmF0ZSBjb25maWcgYW5kCj4gPj4gdGhlIHVzZXIgc2hvdWxkIGJlIGZyZWUg
dG8gY2hvb3NlIHdoZXRoZXIgdG8gZW5hYmxlIHRoZW0gb3Igbm90Lgo+ID4+Cj4gPj4gV2UgY2Fu
IGRpdmlkZSBLQVNBTiBpbnRvIG5vcm1hbCBtb2RlIGFuZCBkZXB0aCBtb2RlLiBOb3JtYWwgbW9k
ZQo+ID4+IHJlY29yZHMgb25seSBtaW5pbWFsIGNyaXRpY2FsIGluZm9ybWF0aW9uLCB3aGlsZSBk
ZXB0aCBtb2RlIHJlY29yZHMKPiA+PiBtb3JlIHBvdGVudGlhbGx5IHVzZWZ1bCBpbmZvcm1hdGlv
bi4KPiA+Pgo+ID4+IEFsc28sIGhvbmVzdGx5LCBJIHRoaW5rIGEgc21hbGwgYW1vdW50IG9mIGV4
dHJhIG1lbW9yeSBjb25zdW1wdGlvbgo+ID4+IHNob3VsZCBub3Qgc3RvcCB1cyBmcm9tIHJlY29y
ZGluZyBtb3JlIGluZm9ybWF0aW9uLgo+ID4+Cj4gPj4gQmVjYXVzZSBpZiBzb21lb25lIGVuYWJs
ZXMgS0FTQU4gZm9yIGRlYnVnZ2luZywgdGhlbiBtZW1vcnkgY29uc3VtcHRpb24KPiA+PiBhbmQg
cGVyZm9ybWFuY2UgYXJlIG5vIGxvbmdlciBoaXMgbWFpbiBjb25jZXJuLgo+ID4KPiA+IFRoZXJl
IGFyZSBhIG51bWJlciBvZiBkZWJ1Z2dpbmcgdG9vbHMgY3JlYXRlZCB3aXRoIHRoZSAicGVyZm9y
bWFuY2UKPiA+IGRvZXMgbm90IG1hdHRlciIgYXR0aXR1ZGUuIFRoZXkgdGVuZCB0byBiZSBiYXJl
bHkgdXNhYmxlLCBub3QgdXNhYmxlCj4gPiBpbiB3aWRlIHNjYWxlIHRlc3RpbmcsIG5vdCB1c2Fi
bGUgaW4gY2FuYXJpZXMsIGV0Yy4KPiA+IEFsbCBvZiBzYW5pdGl6ZXJzIHdlcmUgY3JlYXRlZCB3
aXRoIGxvdHMgb2YgYXR0ZW50aW9uIHRvIHBlcmZvcm1hbmNlLAo+ID4gYXR0ZW50aW9uIG9uIHRo
ZSBsZXZlbCBvZiB0aGUgbW9zdCBwZXJmb3JtYW5jZSBjcml0aWNhbCBwcm9kdWN0aW9uCj4gPiBj
b2RlIChzYW5pdGl6ZXIgY29kZSBpcyBob3R0ZXIgdGhhbiBhbnkgcHJvZHVjdGlvbiBwaWVjZSBv
ZiBjb2RlKS4KPiA+IFRoYXQncyB3aGF0IG1hZGUgdGhlbSBzbyB3aWRlbHkgdXNlZC4gVGhpbmsg
b2YgaW50ZXJhY3RpdmUgdXNlcywKPiA+IHNtYWxsZXIgZGV2aWNlcywgZXRjLiBQbGVhc2UgbGV0
J3Mga2VlcCB0aGlzIGF0dGl0dWRlLgo+Cj4gWWVzLCBJIGFncmVlIHRoYXQgZGVidWdnaW5nIHRv
b2xzIHVzZWQgYXQgYSB3aWRlIHNjYWxlIG5lZWQgdG8gaGF2ZQo+IG1vcmUgcmlnb3JvdXMgcGVy
Zm9ybWFuY2UgY29uc2lkZXJhdGlvbnMuCj4KPiBEbyB5b3UgdGhpbmsgaXQgaXMgd29ydGggdXNp
bmcgdGhlIGV4dHJhIGJ5dGVzIHRvIHJlY29yZCBtb3JlCj4gaW5mb3JtYXRpb24/IElmIHRoaXMg
aXMgYSB1c2VyLWNvbmZpZ3VyYWJsZSBmZWF0dXJlLgoKSWYgaXQncyB1c2VyLWNvbmZpZ3VyYWJs
ZSwgdGhlbiBpdCBpcyBPSy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
