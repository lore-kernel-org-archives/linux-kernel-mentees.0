Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCB0CDB472
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 17:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB3EB4049F;
	Wed, 11 Oct 2023 17:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB3EB4049F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Luutyvpp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMXlBlDL0aJ2; Wed, 11 Oct 2023 17:43:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CD2EE40160;
	Wed, 11 Oct 2023 17:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD2EE40160
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3CABC0039;
	Wed, 11 Oct 2023 17:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF4CCC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 17:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C554B82355
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 17:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C554B82355
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20230601 header.b=Luutyvpp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjEFKsrSJMrA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 17:43:38 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8968682352
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 17:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8968682352
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405459d9a96so6015e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697046215; x=1697651015;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=POLgW7vGVBgqnLcSHIyA8aTEXOElLRzKVX3eHJN8DXY=;
 b=LuutyvppYhN/PrY2VJ/IecEszwksaAfTi+eCQTS/mXs917zGH3DVSdUE3JIM1gyCUP
 resIZoAF2zq8mY5vjl3ggcwbzxG8i/X/pyQBBi5vJX0eZex9k/OWgI8bIGyPxXOxFKHB
 0Y8j30juUkJ/ml96Zx9eo9BFsoj7t2NWiBNp4YzphFV9Blro/njuUhdD+Y34oXxbXDX0
 B3uL76Oz7wNJxhRgSnLea8sI2nVDYJdLp8j9UqFjhoF85a1YQgYqReKwULXV/50JNZTt
 y27As8RcKrMCwCW8mRQBwVwfy84tAU2u6Eqlttcu/ZNtxrCscWsXdKY6FnHOEurdufTp
 wUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697046215; x=1697651015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POLgW7vGVBgqnLcSHIyA8aTEXOElLRzKVX3eHJN8DXY=;
 b=iUebl0vqYdLsK5Ys3eBX+7M6tdE8Ji9a7hGYoXbk2nWXBIaG6+1j5rasmJmsxRgxmo
 uslE5n40GejSQ9/hpfPInVYOyswsm1R7apaJVk2AfSRNNpPTyFp9Ax3aKrQyEql305eE
 MuwT+39qs0PBoSxij9XNZnqcwlYkXaRgpXpyD4ak74giOIm9BthzWENedTeWDAvD7wqD
 XQTOKDfQyH0ZW3uJkVbEogW4P6ap9JkGJhwW+ZP5uPLKHXmpQEFozJ3ZX7KCLrQMf+55
 t6LklpN7E4YI5NlYVip/hsSl+G6GUqEnQ8BRpKd7NX2J5EzJZlH+YXchgHluX9BYqcdU
 79dw==
X-Gm-Message-State: AOJu0Yxx7U1WiPrWgHb+2Q7s1MSHHOlXBri2GRbv/wPrXGataHK3hqHV
 PKxGDikuwiDLvnpdb0q0YfA998L9PMvs0jQ8X0Ky9w==
X-Google-Smtp-Source: AGHT+IEF+mY6rg7imO16vhwcTa8BR4dYmyLxq+Ihn7VM5Sbft/PIxucsoX8vk+dLEu1yk5jdvUp9xRh+Tk2qO8x2Iuw=
X-Received: by 2002:a05:600c:4f81:b0:405:38d1:e146 with SMTP id
 n1-20020a05600c4f8100b0040538d1e146mr149083wmq.4.1697046215172; Wed, 11 Oct
 2023 10:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
 <2023101136-irritate-shrine-cde6@gregkh>
 <3073e9a6-9f10-4326-9734-7e203d509888@gmail.com>
In-Reply-To: <3073e9a6-9f10-4326-9734-7e203d509888@gmail.com>
Date: Wed, 11 Oct 2023 19:43:20 +0200
Message-ID: <CANn89i+hMbhLqXKCF2P=HVeeRSCxvgH_xY1b=T=udLFJjG3ZwA@mail.gmail.com>
Subject: Re: [PATCH] Remove extra unlock for the mutex
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Cc: dsahern@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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
From: Eric Dumazet via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgNTo1MOKAr1BNIEFiaGluYXYgU2luZ2gKPHNpbmdoYWJo
aW5hdjkwNTE1NzE4MzNAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDEwLzExLzIzIDEyOjAwLCBH
cmVnIEtIIHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMDQ6MTY6MzBBTSArMDUz
MCwgQWJoaW5hdiBTaW5naCB3cm90ZToKPiA+PiBUaGVyZSBpcyBhIGRvdWJsZSB1bmxvY2sgb24g
bXV0ZXguIFRoaXMgY2FuIGNhdXNlIHVuZGVmaW5lZCBiZWhhdmlvdXIuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBBYmhpbmF2IFNpbmdoIDxzaW5naGFiaGluYXY5MDUxNTcxODMzQGdtYWlsLmNv
bT4KPiA+PiAtLS0KPiA+PiAgIG5ldC9pcHY0L2luZXRfY29ubmVjdGlvbl9zb2NrLmMgfCAxIC0K
PiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvbmV0L2lwdjQvaW5ldF9jb25uZWN0aW9uX3NvY2suYyBiL25ldC9pcHY0L2luZXRfY29ubmVj
dGlvbl9zb2NrLmMKPiA+PiBpbmRleCBhZWViZTg4MTY2ODkuLmYxMWZlOGM3MjdhNCAxMDA2NDQK
PiA+PiAtLS0gYS9uZXQvaXB2NC9pbmV0X2Nvbm5lY3Rpb25fc29jay5jCj4gPj4gKysrIGIvbmV0
L2lwdjQvaW5ldF9jb25uZWN0aW9uX3NvY2suYwo+ID4+IEBAIC01OTcsNyArNTk3LDYgQEAgaW50
IGluZXRfY3NrX2dldF9wb3J0KHN0cnVjdCBzb2NrICpzaywgdW5zaWduZWQgc2hvcnQgc251bSkK
PiA+PiAgICAgIH0KPiA+PiAgICAgIGlmIChoZWFkMl9sb2NrX2FjcXVpcmVkKQo+ID4+ICAgICAg
ICAgICAgICBzcGluX3VubG9jaygmaGVhZDItPmxvY2spOwo+ID4+IC0gICAgc3Bpbl91bmxvY2tf
YmgoJmhlYWQtPmxvY2spOwo+ID4KPiA+IEhvdyB3YXMgdGhpcyB0ZXN0ZWQ/Cj4gPgo+ID4gQW5k
IHdoZXJlIGlzIHRoZSBub3ctbmVlZGVkIHVubG9jayBvZiB0aGUgaGVhZC0+bG9jaz8KPiA+Cj4g
PiBIb3cgd2FzIHRoaXMgY2hhbmdlIGZvdW5kPwo+ID4KPiA+IEFuZCB5b3VyIHN1YmplY3QgbGlu
ZSBuZWVkcyBhIGxvdCBvZiB3b3JrLi4uCj4gPgo+ID4gdGhhbmtzLAo+ID4KPiA+IGdyZWcgay1o
Cj4gSGVsbG8sIEkgdXNlZCBzcGFyc2UgdG9vbCBhbmQgZ290IGl0IHRoaXMgd2FybmluZyBtZXNz
YWdlICJ3YXJuaW5nOgo+IGNvbnRleHQgaW1iYWxhbmNlIGluICdpbmV0X2Nza19nZXRfcG9ydCcg
LSB1bmV4cGVjdGVkIHVubG9jayIKPiBEdWUgdG8gbXkgb3ZlciBleGNpdGVtZW50IG9mIHNlbmRp
bmcgYSBnb29kIHBhdGNoIHRvIGtlcm5lbCBJIGRpZG50IHNlZQo+IGNvcnJlY3RseSBhbmQgbWlz
cmVhZCBgaGVhZGAgYXMgYGhlYWQyYCBhbmQgdGhvdWdodCBpdCB3YXMgZG91YmxlCj4gdW5sb2Nr
aW5nIHRoZSBtdXRleC4gSSBtIHZlcnkgc29ycnkuIEJ1dCBvbiBhIGRpZmZlcmVudCBub3RlIHRo
aW5rIHdlCj4gc2hvdWxkIGRvIGEgY2hlY2sgZm9yIGBoZWFkLT5sb2NrYCBhcyB3ZWxsIGJlZm9y
ZSB1bmxvY2tpbmcuIFVubG9ja2luZyBhCj4gbm9uIGxvY2tlZCBtdXRleCBjYW4gYWxzbyB0cmln
Z2VyIGEgdW5kZWZpbmVkIGJlaGF2aW91ci4KPgoKVGhlcmUgaXMgbm8gdW5kZWZpbmVkIGJlaGF2
aW9yLCBvbmx5IHNwYXJzZSB0aGF0IG1pZ2h0IGJlIGNvbmZ1c2VkIGEgbGl0dGxlLgoKSSBkbyBu
b3QgdGhpbmsgd2UgY2FuIGV4cHJlc3MgaW4gc3BhcnNlIHRoZSBmYWN0IHRoYXQKaW5ldF9jc2tf
ZmluZF9vcGVuX3BvcnQoKSBhY3F1aXJlcyBoZWFkLT5sb2NrCgooaGVhZCBiZWluZyB0aGUgcmV0
dXJuIHZhbHVlIG9mIHRoaXMgZnVuY3Rpb24uLi4pCgpUaGUgZm9sbG93aW5nIGRvZXMgbm90IGhl
bHAuCgpkaWZmIC0tZ2l0IGEvbmV0L2lwdjQvaW5ldF9jb25uZWN0aW9uX3NvY2suYyBiL25ldC9p
cHY0L2luZXRfY29ubmVjdGlvbl9zb2NrLmMKaW5kZXggYWVlYmU4ODE2Njg5OTYwNTdkMTQ5NWM4
NGVlZTBmMGI2NDRiN2FkMC4uZWQ3YjM5OTMzMTZjZDFiYTBiMjg1OWIwYmQzZjQ0N2UwNjZiZDNi
NQoxMDA2NDQKLS0tIGEvbmV0L2lwdjQvaW5ldF9jb25uZWN0aW9uX3NvY2suYworKysgYi9uZXQv
aXB2NC9pbmV0X2Nvbm5lY3Rpb25fc29jay5jCkBAIC0zMjMsNiArMzIzLDcgQEAgc3RhdGljIHN0
cnVjdCBpbmV0X2JpbmRfaGFzaGJ1Y2tldCAqCiBpbmV0X2Nza19maW5kX29wZW5fcG9ydChjb25z
dCBzdHJ1Y3Qgc29jayAqc2ssIHN0cnVjdAppbmV0X2JpbmRfYnVja2V0ICoqdGJfcmV0LAogICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW5ldF9iaW5kMl9idWNrZXQgKip0YjJfcmV0LAog
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW5ldF9iaW5kX2hhc2hidWNrZXQgKipoZWFk
Ml9yZXQsIGludCAqcG9ydF9yZXQpCisgICAgICAgX19hY3F1aXJlcyhoZWFkLT5sb2NrKQogewog
ICAgICAgIHN0cnVjdCBpbmV0X2hhc2hpbmZvICpoaW5mbyA9IHRjcF9vcl9kY2NwX2dldF9oYXNo
aW5mbyhzayk7CiAgICAgICAgaW50IGksIGxvdywgaGlnaCwgYXR0ZW1wdF9oYWxmLCBwb3J0LCBs
M21kZXY7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0
cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
