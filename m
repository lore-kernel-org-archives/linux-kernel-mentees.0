Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651D1C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 Jul 2023 07:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D13A3611CC;
	Wed, 26 Jul 2023 07:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D13A3611CC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=b89jjWwJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_aTsJ5bokI0; Wed, 26 Jul 2023 07:20:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B9D3E611B2;
	Wed, 26 Jul 2023 07:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D3E611B2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2E0EC0071;
	Wed, 26 Jul 2023 07:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06DB0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 07:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD3C611CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 07:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCD3C611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9rtLQhRGTkY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 07:20:34 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 524C9611B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 07:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 524C9611B2
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b702319893so94798581fa.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 00:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690356032; x=1690960832;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qIjAg3STPHrNomBKUumGhrzH+A1OTejnaQKtF+Ii1BY=;
 b=b89jjWwJiBDG2oEiGcg/JALiB45ddMP2u6a2WXMQEM8EZGteM5sCa7eH3PNzkQyYHC
 QPGZPY4O9IEmitqWRDReKl5g6XwASzx/pKRrNauSttsyC4RJHqGyoVerbgqNZ90+LYS3
 PK89OErr44MIWudAgTKUwMFbP7LcRd/CpkmpZ2Tito6IGdfQyZWaMceythWP7zw3H4IL
 wh9YLhodxBhpjmC1HqZdwQBvJc+iHPWXvIjqLg9PDxOg4t6he2D1f0QDWrxM0/ygARwT
 2MN1nMkPOVJgE7oXWndmuo0LTTsC8jg/kfdjEN6PkAbwZF5UEsUxVNHXMBGss1LZI6oC
 GTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690356032; x=1690960832;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qIjAg3STPHrNomBKUumGhrzH+A1OTejnaQKtF+Ii1BY=;
 b=jNIsbqHmTFZ7EnRrclJiJTFcAIVVFQvhlQQCIyXt3OZY0nqxxU+iEoNCs75mhMcbnO
 o38qDpgyyaM0YsMyoNxueGmUEx7+tU9z/LBZh9WaGnZfu89UC67a193iO0NOkeXM1SE8
 Xx4wNXjqH2AQyvt8l/nI92BdhOnZGGSpjyCotER90FVFCg40N3z0EcxG2xVNFOS6YoDr
 zKPwblJdhzCXnH+CoOTXSj06MpGHPqCfHAIImWFUi5omsz7/UbXk+Jjlj8wgctFKy0Nh
 J0BDfaahy9LZHymG4e6Lx+EtsJGqC8BJwd82V298/sfkx+HRQ2jrDDqyXixURkCxH36l
 sorw==
X-Gm-Message-State: ABy/qLYwjFufdM1UGwDfw5rb7mmEfUJH+zFfHAeO7fR0dhmmjfLH5vib
 8Ln5VNrbPtILUPpDMCoKKQI=
X-Google-Smtp-Source: APBJJlE4digYFNcgniMLPCgyqsbVEt12BREu8UdInq/XleqlenAUDJygmszhWK7XdWTDrcfDThHHEw==
X-Received: by 2002:a2e:900a:0:b0:2b5:974f:385 with SMTP id
 h10-20020a2e900a000000b002b5974f0385mr808562ljg.9.1690356031776; 
 Wed, 26 Jul 2023 00:20:31 -0700 (PDT)
Received: from akanner-r14. ([77.222.25.78]) by smtp.gmail.com with ESMTPSA id
 v14-20020a2e960e000000b002b9b90474c7sm132830ljh.129.2023.07.26.00.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:20:31 -0700 (PDT)
Message-ID: <64c0c93f.2e0a0220.25086.02ae@mx.google.com>
X-Google-Original-Message-ID: <ZMDJO1BGGJV4PQAZ@akanner-r14.>
Date: Wed, 26 Jul 2023 10:20:27 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 brouer@redhat.com, kuba@kernel.org, pabeni@redhat.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMTA6MDk6NTNBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiBPbiBUdWUsIEp1bCAyNSwgMjAyMyBhdCAxMTo1NOKAr1BNIEFuZHJldyBLYW5uZXIgPGFu
ZHJldy5rYW5uZXJAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBTeXprYWxsZXIgcmVwb3J0ZWQg
dGhlIGZvbGxvd2luZyBpc3N1ZToKPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ID4gVG9vIEJJRyB4ZHAtPmZyYW1lX3N6ID0gMTMxMDcyCj4gPiBXQVJOSU5HOiBD
UFU6IDAgUElEOiA1MDIwIGF0IG5ldC9jb3JlL2ZpbHRlci5jOjQxMjEKPiA+ICAgX19fX2JwZl94
ZHBfYWRqdXN0X3RhaWwgbmV0L2NvcmUvZmlsdGVyLmM6NDEyMSBbaW5saW5lXQo+ID4gV0FSTklO
RzogQ1BVOiAwIFBJRDogNTAyMCBhdCBuZXQvY29yZS9maWx0ZXIuYzo0MTIxCj4gPiAgIGJwZl94
ZHBfYWRqdXN0X3RhaWwrMHg0NjYvMHhhMTAgbmV0L2NvcmUvZmlsdGVyLmM6NDEwMwo+ID4gLi4u
Cj4gPiBDYWxsIFRyYWNlOgo+ID4gIDxUQVNLPgo+ID4gIGJwZl9wcm9nXzRhZGQ4N2U1MzAxYTQx
MDUrMHgxYS8weDFjCj4gPiAgX19icGZfcHJvZ19ydW4gaW5jbHVkZS9saW51eC9maWx0ZXIuaDo2
MDAgW2lubGluZV0KPiA+ICBicGZfcHJvZ19ydW5feGRwIGluY2x1ZGUvbGludXgvZmlsdGVyLmg6
Nzc1IFtpbmxpbmVdCj4gPiAgYnBmX3Byb2dfcnVuX2dlbmVyaWNfeGRwKzB4NTdlLzB4MTFlMCBu
ZXQvY29yZS9kZXYuYzo0NzIxCj4gPiAgbmV0aWZfcmVjZWl2ZV9nZW5lcmljX3hkcCBuZXQvY29y
ZS9kZXYuYzo0ODA3IFtpbmxpbmVdCj4gPiAgZG9feGRwX2dlbmVyaWMrMHgzNWMvMHg3NzAgbmV0
L2NvcmUvZGV2LmM6NDg2Ngo+ID4gIHR1bl9nZXRfdXNlcisweDIzNDAvMHgzY2EwIGRyaXZlcnMv
bmV0L3R1bi5jOjE5MTkKPiA+ICB0dW5fY2hyX3dyaXRlX2l0ZXIrMHhlOC8weDIxMCBkcml2ZXJz
L25ldC90dW4uYzoyMDQzCj4gPiAgY2FsbF93cml0ZV9pdGVyIGluY2x1ZGUvbGludXgvZnMuaDox
ODcxIFtpbmxpbmVdCj4gPiAgbmV3X3N5bmNfd3JpdGUgZnMvcmVhZF93cml0ZS5jOjQ5MSBbaW5s
aW5lXQo+ID4gIHZmc193cml0ZSsweDY1MC8weGU0MCBmcy9yZWFkX3dyaXRlLmM6NTg0Cj4gPiAg
a3N5c193cml0ZSsweDEyZi8weDI1MCBmcy9yZWFkX3dyaXRlLmM6NjM3Cj4gPiAgZG9fc3lzY2Fs
bF94NjQgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6NTAgW2lubGluZV0KPiA+ICBkb19zeXNjYWxs
XzY0KzB4MzgvMHhiMCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo4MAo+ID4gIGVudHJ5X1NZU0NB
TExfNjRfYWZ0ZXJfaHdmcmFtZSsweDYzLzB4Y2QKPiA+Cj4gPiB4ZHAtPmZyYW1lX3N6ID4gUEFH
RV9TSVpFIGNoZWNrIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdCBjODc0MWUyYmZlODcKPiA+ICgi
eGRwOiBBbGxvdyBicGZfeGRwX2FkanVzdF90YWlsKCkgdG8gZ3JvdyBwYWNrZXQgc2l6ZSIpLiBC
dXQKPiA+IHR1bl9nZXRfdXNlcigpIHN0aWxsIHByb3ZpZGVzIGFuIGV4ZWN1dGlvbiBwYXRoIHdp
dGggZG9feGRwX2dlbmVyaWMoKQo+ID4gYW5kIGV4Y2VlZCBYRFAgbGltaXRzIGZvciBwYWNrZXQg
c2l6ZS4KPiA+Cj4gPiBVc2luZyB0aGUgc3l6a2FsbGVyIHJlcHJvIHdpdGggcmVkdWNlZCBwYWNr
ZXQgc2l6ZSBpdCB3YXMgYWxzbwo+ID4gZGlzY292ZXJlZCB0aGF0IFhEUF9QQUNLRVRfSEVBRFJP
T00gaXMgbm90IGNoZWNrZWQgaW4KPiA+IHR1bl9jYW5fYnVpbGRfc2tiKCksIGFsdGhvdWdoIHBh
ZCBtYXkgYmUgaW5jcmVtZW50ZWQgaW4KPiA+IHR1bl9idWlsZF9za2IoKS4KPiA+Cj4gPiBJZiB3
ZSBtb3ZlIHRoZSBsaW1pdCBjaGVjayBmcm9tIHR1bl9jYW5fYnVpbGRfc2tiKCkgdG8gdHVuX2J1
aWxkX3NrYigpCj4gPiB3ZSB3aWxsIG1ha2UgeGRwIHRvIGJlIHVzZWQgb25seSBpbiB0dW5fYnVp
bGRfc2tiKCksIHdpdGhvdXQgZmFsbGluZwo+ID4gaW4gdHVuX2FsbG9jX3NrYigpLCBldGMuIEFu
ZCBtb3Jlb3ZlciB3ZSB3aWxsIGRyb3AgdGhlIHBhY2tldCB3aGljaAo+ID4gY2FuJ3QgYmUgcHJv
Y2Vzc2VkIGluIHR1bl9idWlsZF9za2IoKS4KPiA+Cj4gPiBSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5
OiBzeXpib3QrZjgxNzQ5MGY1YmQyMDU0MWI5MGFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+
ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMDAwMDAwMDAwMDAwNzc0Yjky
MDVmMWQ4YTgwZEBnb29nbGUuY29tL1QvCj4gPiBMaW5rOiBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS9idWc/aWQ9NTMzNWM3YzYyYmZmZjg5YmJiMWM4ZjE0Y2RhYmViZTkxOTA5MDYwZgo+
ID4gRml4ZXM6IDdkZjEzMjE5ZDc1NyAoInR1bjogcmVzZXJ2ZSBleHRyYSBoZWFkcm9vbSBvbmx5
IHdoZW4gWERQIGlzIHNldCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgS2FubmVyIDxhbmRy
ZXcua2FubmVyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4KPiA+IE5vdGVzOgo+ID4gICAgIFYyIC0+
IFYzOgo+ID4gICAgICogYXR0YWNoIHRoZSBmb3Jnb3R0ZW4gY2hhbmdlbG9nCj4gPiAgICAgVjEg
LT4gVjI6Cj4gPiAgICAgKiBtZXJnZWQgMiBwYXRjaGVzIGluIDEsIGZpeGluZyBib3RoIGlzc3Vl
czogV0FSTl9PTl9PTkNFIHdpdGgKPiA+ICAgICAgIHN5emthbGxlciByZXBybyBhbmQgbWlzc2lu
ZyBYRFBfUEFDS0VUX0hFQURST09NIGluIHBhZAo+ID4gICAgICogY2hhbmdlZCB0aGUgdGl0bGUg
YW5kIGRlc2NyaXB0aW9uIG9mIHRoZSBleGVjdXRpb24gcGF0aCwgc3VnZ2VzdGVkCj4gPiAgICAg
ICBieSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gICAgICogbW92ZSB0aGUg
bGltaXQgY2hlY2sgZnJvbSB0dW5fY2FuX2J1aWxkX3NrYigpIHRvIHR1bl9idWlsZF9za2IoKSB0
bwo+ID4gICAgICAgcmVtb3ZlIGR1cGxpY2F0aW9uIGFuZCBsb2NraW5nIGlzc3VlLCBhbmQgYWxz
byBkcm9wIHRoZSBwYWNrZXQgaW4KPiA+ICAgICAgIGNhc2Ugb2YgYSBmYWlsZWQgY2hlY2sgLSBu
b3RlZCBieSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IAo+IEFja2VkLWJ5OiBK
YXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IAo+IFRoYW5rcwo+IAo+ID4KPiA+ICBk
cml2ZXJzL25ldC90dW4uYyB8IDcgKysrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3R1bi5jIGIvZHJpdmVycy9uZXQvdHVuLmMKPiA+IGluZGV4IGQ3NTQ1NmFkYzYyYS4uN2MyYjA1
Y2UwNDIxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvdHVuLmMKPiA+ICsrKyBiL2RyaXZl
cnMvbmV0L3R1bi5jCj4gPiBAQCAtMTU5NCwxMCArMTU5NCw2IEBAIHN0YXRpYyBib29sIHR1bl9j
YW5fYnVpbGRfc2tiKHN0cnVjdCB0dW5fc3RydWN0ICp0dW4sIHN0cnVjdCB0dW5fZmlsZSAqdGZp
bGUsCj4gPiAgICAgICAgIGlmICh6ZXJvY29weSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
ZmFsc2U7Cj4gPgo+ID4gLSAgICAgICBpZiAoU0tCX0RBVEFfQUxJR04obGVuICsgVFVOX1JYX1BB
RCkgKwo+ID4gLSAgICAgICAgICAgU0tCX0RBVEFfQUxJR04oc2l6ZW9mKHN0cnVjdCBza2Jfc2hh
cmVkX2luZm8pKSA+IFBBR0VfU0laRSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gPiAtCj4gPiAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gIH0KPiA+Cj4gPiBAQCAtMTY3Myw2
ICsxNjY5LDkgQEAgc3RhdGljIHN0cnVjdCBza19idWZmICp0dW5fYnVpbGRfc2tiKHN0cnVjdCB0
dW5fc3RydWN0ICp0dW4sCj4gPiAgICAgICAgIGJ1ZmxlbiArPSBTS0JfREFUQV9BTElHTihsZW4g
KyBwYWQpOwo+ID4gICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiA+Cj4gPiArICAgICAgIGlm
IChidWZsZW4gPiBQQUdFX1NJWkUpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
LUVGQVVMVCk7Cj4gPiArCj4gPiAgICAgICAgIGFsbG9jX2ZyYWctPm9mZnNldCA9IEFMSUdOKCh1
NjQpYWxsb2NfZnJhZy0+b2Zmc2V0LCBTTVBfQ0FDSEVfQllURVMpOwo+ID4gICAgICAgICBpZiAo
dW5saWtlbHkoIXNrYl9wYWdlX2ZyYWdfcmVmaWxsKGJ1ZmxlbiwgYWxsb2NfZnJhZywgR0ZQX0tF
Uk5FTCkpKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ID4g
LS0KPiA+IDIuMzkuMwo+ID4KPiAKClRoYW5rcywgSmFzb24uCgpDYW4gYW55b25lIHBvaW50IG1l
IHRvIHNvbWUgdGVzdHMgb3RoZXIgdGhhbgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdHVu
LmM/CgpUaGlzIG9uZSBzaG93czoKUEFTU0VEOiA1IC8gNSB0ZXN0cyBwYXNzZWQuCgpJJ20gdHJ5
aW5nIHRvIGZpZ3VyZSBvdXQgaWYgd2UncmUgZHJvcHBpbmcgbW9yZSBwYWNrZXRzIHRoYW4gZXhw
ZWN0ZWQKd2l0aCB0aGlzIHBhdGNoLiBOb3Qgc3VyZSBpZiB0aGUgdGVzdCBhYm92ZSBpcyBlbm91
Z2guCgotLSAKQW5kcmV3IEthbm5lcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2Vy
bmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
