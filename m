Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAC7E95A8E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Oct 2023 06:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBD4C8219B;
	Mon,  9 Oct 2023 06:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBD4C8219B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3H6b587RO1oX; Mon,  9 Oct 2023 06:33:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F41CD82154;
	Mon,  9 Oct 2023 06:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41CD82154
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB049C0039;
	Mon,  9 Oct 2023 06:33:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 821FBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 06:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56B0E61130
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 06:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B0E61130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqneIsNoUdqL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 06:33:42 +0000 (UTC)
X-Greylist: delayed 1297 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 09 Oct 2023 06:33:42 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51450605E8
Received: from www84.your-server.de (www84.your-server.de [213.133.104.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51450605E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 06:33:42 +0000 (UTC)
Received: from ip5f5bee74.dynamic.kabel-deutschland.de ([95.91.238.116]
 helo=redqueen.local)
 by www84.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <stefani@seibold.net>)
 id 1qpjUn-000FgQ-OE; Mon, 09 Oct 2023 08:12:01 +0200
Message-ID: <5fbff954709bbdebe5872dcb40d32aba384cfe43.camel@seibold.net>
Subject: Re: [PATCH v1] samples: kfifo: Fixes a typo
From: Stefani Seibold <stefani@seibold.net>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Date: Mon, 09 Oct 2023 08:11:56 +0200
In-Reply-To: <20230817173636.78757-1-atulpant.linux@gmail.com>
References: <20230817173636.78757-1-atulpant.linux@gmail.com>
Autocrypt: addr=stefani@seibold.net; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-Authenticated-Sender: stefani@seibold.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27055/Sun Oct  8 09:39:49 2023)
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

QWNrZWQgYnkgU3RlZmFuaSBTZWlib2xkIDxzdGVmYW5pQHNlaWJvbGQubmV0PgoKT24gVGh1LCAy
MDIzLTA4LTE3IGF0IDIzOjA2ICswNTMwLCBBdHVsIEt1bWFyIFBhbnQgd3JvdGU6Cj4gRml4ZXMg
YSB0eXBvIGluIGEgY29tbWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBdHVsIEt1bWFyIFBhbnQg
PGF0dWxwYW50LmxpbnV4QGdtYWlsLmNvbT4KPiAtLS0KPiDCoHNhbXBsZXMva2ZpZm8vZG1hLWV4
YW1wbGUuYyB8IDQgKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2FtcGxlcy9rZmlmby9kbWEtZXhhbXBsZS5j
IGIvc2FtcGxlcy9rZmlmby9kbWEtCj4gZXhhbXBsZS5jCj4gaW5kZXggMGNmMjc0ODNjYjM2Li4x
MTJiMGU0MjcxOTkgMTAwNjQ0Cj4gLS0tIGEvc2FtcGxlcy9rZmlmby9kbWEtZXhhbXBsZS5jCj4g
KysrIGIvc2FtcGxlcy9rZmlmby9kbWEtZXhhbXBsZS5jCj4gQEAgLTgwLDcgKzgwLDcgQEAgc3Rh
dGljIGludCBfX2luaXQgZXhhbXBsZV9pbml0KHZvaWQpCj4gwqAJCQlicmVhazsKPiDCoAl9Cj4g
wqAKPiAtCS8qIHB1dCBoZXJlIHlvdXIgY29kZSB0byBzZXR1cCBhbmQgZXhlY3R1dGUgdGhlIGRt
YQo+IG9wZXJhdGlvbiAqLwo+ICsJLyogcHV0IGhlcmUgeW91ciBjb2RlIHRvIHNldHVwIGFuZCBl
eGVjdXRlIHRoZSBkbWEgb3BlcmF0aW9uCj4gKi8KPiDCoAkvKiAuLi4gKi8KPiDCoAo+IMKgCS8q
IGV4YW1wbGU6IHplcm8gYnl0ZXMgcmVjZWl2ZWQgKi8KPiBAQCAtMTA5LDcgKzEwOSw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IGV4YW1wbGVfaW5pdCh2b2lkKQo+IMKgCQkJYnJlYWs7Cj4gwqAJfQo+
IMKgCj4gLQkvKiBwdXQgaGVyZSB5b3VyIGNvZGUgdG8gc2V0dXAgYW5kIGV4ZWN0dXRlIHRoZSBk
bWEKPiBvcGVyYXRpb24gKi8KPiArCS8qIHB1dCBoZXJlIHlvdXIgY29kZSB0byBzZXR1cCBhbmQg
ZXhlY3V0ZSB0aGUgZG1hIG9wZXJhdGlvbgo+ICovCj4gwqAJLyogLi4uICovCj4gwqAKPiDCoAkv
KiBleGFtcGxlOiA1IGJ5dGVzIHRyYW5zbWl0dGVkICovCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
