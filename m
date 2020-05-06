Return-Path: <SRS0=QKD6=6U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9950DC47258
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 08:36:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677942073A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 08:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjKgnWYP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677942073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4072687D6A;
	Wed,  6 May 2020 08:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ds6QKrP-KbMM; Wed,  6 May 2020 08:36:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94CD887B8E;
	Wed,  6 May 2020 08:36:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A60EC0863;
	Wed,  6 May 2020 08:36:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29338C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 186D986AFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-XLRjeFUdhl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:36:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 61B1486AB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:36:48 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A1AA20714;
 Wed,  6 May 2020 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588754208;
 bh=50g+AtsmT/CiMEfaIWU4IUHfgtyLkycfmMYQagXxz4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DjKgnWYPfjN9UjR2ssaDFyi62flWtTeDJmNhwAi9o72KEL4/ZKnECOcvokU0GrnN7
 3UrPrJJzRWa9/jri80nkXB+EcU1cOgp/FLJIlbQB2ag5rd4YpHcRBRKoO8an5rabOM
 5jnmU91IHeqrKcUi08Iy0qCjrQG+2J6Pa5/xBkFE=
Date: Wed, 6 May 2020 10:36:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200506103643.699fe077@coco.lan>
In-Reply-To: <81B965F9-3A09-40D0-87DF-611A153E744C@getmailspring.com>
References: <20200503095105.6b8f0d3f@coco.lan>
 <81B965F9-3A09-40D0-87DF-611A153E744C@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "sean@mess.org" <sean@mess.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "allison@lohutok.net" <allison@lohutok.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v4 08/11] media: vidtv: implement a PSI generator
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

RW0gV2VkLCA2IE1heSAyMDIwIDAzOjI4OjE3IC0wMzAwCiJEYW5pZWwgVy4gUy4gQWxtZWlkYSIg
PGR3bHNhbG1laWRhQGdtYWlsLmNvbT4gZXNjcmV2ZXU6Cgo+ID4+ICsJLyogSnVzdCBhIHNhbml0
eSBjaGVjaywgc2hvdWxkIG5vdCByZWFsbHkgaGFwcGVuIGJlY2F1c2Ugd2Ugc3R1ZmYKPiA+PiAr
CSAqIHRoZSBwYWNrZXQgd2hlbiB3ZSBmaW5pc2ggYSBzZWN0aW9uLCBpLmUuIHdoZW4gd2Ugd3Jp
dGUgdGhlIGNyYyBhdAo+ID4+ICsJICogdGhlIGVuZC4gQnV0IGlmIHRoaXMgaGFwcGVucyB0aGVu
IHdlIGhhdmUgbWVzc2VkIHVwIHRoZSBsb2dpYwo+ID4+ICsJICogc29tZXdoZXJlLgo+ID4+ICsJ
ICovCj4gPj4gKwlXQVJOX09OKGFyZ3MubmV3X3BzaV9zZWN0aW9uICYmICFhbGlnbmVkKTsgIAo+
ID4gIAo+ID4gUGxlYXNlIHVzZSBhIHJhdGVsaW1pdGVkIHByaW50ayBpbnN0ZWFkIChoZXJlIGFu
ZCBvbiBhbGwgc2ltaWxhciBjYXNlcwo+ID4gYXQgdGhlIFRTIGdlbmVyYXRvcikuCj4gPiAgCj4g
PiBBbHNvLCBJIHRoaW5rIHRoYXQsIG9uIHN1Y2ggY2FzZSwgdGhlIGRyaXZlciBzaG91bGQgYmUg
ZmlsbGluZyB0aGUKPiA+IHJlbWFpbmluZyBmcmFtZSB3aXRoIHBhZCBieXRlcy4gRS4gZy46Cj4g
PiAgCj4gPiAJLyogIAo+ID4gCSAqIEFzc3VtaW5nIHRoYXQgdmlkdHZfbWVtc2V0KCkgYXJncyBm
cm9tIHBhdGNoIDA2LzExIHdlcmUgY2hhbmdlZCAgCj4gPiAJICogYWNjb3JkaW5nIHdpdGggdGhp
cyBwcm90b3R5cGU6ICAKPiA+IAkgKi8KPiA+IAlzaXplX3QgdmlkdHZfbWVtc2V0KHZvaWQgKnRv
LCBzaXplX3QgdG9fb2Zmc2V0LCBzaXplX3QgdG9fc2l6ZSwKPiA+IAkJCSAgICB1OCBjLCBzaXpl
X3QgbGVuKTsKPiA+ICAKPiA+ICAKPiA+IAkjZGVmaW5lIFRTX0ZJTExfQllURSAweGZmCj4gPiAg
Cj4gPiAJaWYgKGFyZ3MubmV3X3BzaV9zZWN0aW9uICYmICFhbGlnbmVkKSB7Cj4gPiAJCXByX3dh
cm5fcmF0ZWxpbWl0KCJXYXJuaW5nOiBQU0kgbm90IGFsaWduZWQuIFJlLWFsaWduaW5nIGl0XG4i
KTsKPiA+ICAKPiA+IAkJdmlkdHZfbWVtc2V0KGFyZ3MuZGVzdF9idWYsCj4gPiAJCQkgICAgIGFy
Z3MuZGVzdF9vZmZzZXQgKyBuYnl0ZXNfcGFzdF9ib3VuZGFyeSwKPiA+IAkJCSAgICAgYXJncy5k
ZXN0X2J1Zl9zeiwKPiA+IAkJCSAgICAgVFNfRklMTF9CWVRFLAkJCj4gPiAJCQkgICAgIFRTX1BB
Q0tFVF9MRU4gLSBuYnl0ZXNfcGFzdF9ib3VuZGFyeSk7Cj4gPiAJCWFyZ3MuZGVzdF9vZmZzZXQg
Kz0gVFNfUEFDS0VUX0xFTiAtIG5ieXRlc19wYXN0X2JvdW5kYXJ5Owo+ID4gCQlhbGlnbmVkID0g
MTsKPiA+IAkJbmJ5dGVzX3Bhc3RfYm91bmRhcnkgPSAwOwo+ID4gCX0KPiA+ICAgIAo+IAo+IFN1
cmUsIHRoYXQncyBmaW5lIHRoZW4hIEp1c3QgdG8gYmUgY2xlYXIgdGhpcyBzaG91bGQgbm90IGhh
cHBlbiBhdCBhbGwsCj4gYmVjYXVzZSB0aGUgd3JpdGVzIHNob3VsZCBnbyB0aHJvdWdoIG9uZSBv
ZiB0aGVzZSBmb3VyIGZ1bmN0aW9ucyAoSUlSQyEpOgo+IAo+IHUzMiB2aWR0dl90c19udWxsX3dy
aXRlX2ludG8oc3RydWN0IG51bGxfcGFja2V0X3dyaXRlX2FyZ3MgYXJncykKPiB1MzIgdmlkdHZf
dHNfcGNyX3dyaXRlX2ludG8oc3RydWN0IHBjcl93cml0ZV9hcmdzIGFyZ3MpCj4gCj4gLi4ud2hp
Y2ggd2lsbCB3cml0ZSBhIHNpbmdsZSBwYWNrZXQgYXQgYSB0aW1lLCB0aHVzIGxlYXZpbmcgdGhl
IGJ1ZmZlcgo+IGFsaWduZWQgaWYgaXQgd2FzIGFscmVhZHkgYWxpZ25lZCB0byBiZWdpbiB3aXRo
LAo+IAo+IGFuZAo+IAo+IHUzMiB2aWR0dl9wZXNfd3JpdGVfaW50byhzdHJ1Y3QgcGVzX3dyaXRl
X2FyZ3MgYXJncykKPiBzdGF0aWMgdTMyCj4gdmlkdHZfcHNpX3RzX3BzaV93cml0ZV9pbnRvKHN0
cnVjdCBwc2lfd3JpdGVfYXJncyBhcmdzKQo+IAo+IC4uLndoaWNoIHdpbGwgcGFkIHdoZW4gdGhl
eSBmaW5pc2ggd3JpdGluZyBhIFBFUyBwYWNrZXQgb3IgYSB0YWJsZQo+IHNlY3Rpb24sIHJlc3Bl
Y3RpdmVseS4KPiAKPiBJIGxlZnQgdGhlc2Ugd2FybmluZ3MgYmVoaW5kIGFzIGEgd2F5IHRvIHdh
cm4gbWUgaWYgdGhlIHBhZGRpbmcgbG9naWMKPiBpdHNlbGYgaXMgYnJva2VuLgoKT0shCgo+ID4g
UGxlYXNlIHVzZSBhIHJhdGVsaW1pdGVkIHByaW50ayBpbnN0ZWFkIChoZXJlIGFuZCBvbiBhbGwg
c2ltaWxhciBjYXNlcwo+ID4gYXQgdGhlIFRTIGdlbmVyYXRvcikuICAKPiAKPiBPSy4KPiAKPiAK
PiAKPiA+PiArc3RhdGljIHZvaWQgdmlkdHZfcHNpX2Rlc2NfdG9fYmUoc3RydWN0IHZpZHR2X3Bz
aV9kZXNjICpkZXNjKQo+ID4+ICt7Cj4gPj4gKwkvKgo+ID4+ICsJICogQ29udmVydCBkZXNjcmlw
dG9yIGVuZGlhbm5lc3MgdG8gYmlnLWVuZGlhbiBvbiBhIGZpZWxkLWJ5LWZpZWxkCj4gPj4gYmFz
aXMKPiA+PiArCSAqIHdoZXJlIGFwcGxpY2FibGUKPiA+PiArCSAqLwo+ID4+ICsKPiA+PiArCXN3
aXRjaCAoZGVzYy0+dHlwZSkgewo+ID4+ICsJLyogbm90aGluZyBkbyBkbyAqLwo+ID4+ICsJY2Fz
ZSBTRVJWSUNFX0RFU0NSSVBUT1I6Cj4gPj4gKwkJYnJlYWs7Cj4gPj4gKwljYXNlIFJFR0lTVFJB
VElPTl9ERVNDUklQVE9SOgo+ID4+ICsJCWNwdV90b19iZTMycygmKChzdHJ1Y3QgdmlkdHZfcHNp
X2Rlc2NfcmVnaXN0cmF0aW9uICopCj4gPj4gKwkJCSAgICAgZGVzYyktPmZvcm1hdF9pZGVudGlm
aWVyKTsKPiA+PiArCQlwcl9hbGVydCgiJXM6IGRlc2NyaXB0b3IgdHlwZSAlZCBmb3VuZFxuIiwK
PiA+PiArCQkJIF9fZnVuY19fLAo+ID4+ICsJCQkgZGVzYy0+dHlwZSk7Cj4gPj4gKwkJcHJfYWxl
cnQoIiVzOiBjaGFuZ2UgJ2FkZGl0aW9uYWxfaW5mbycgZW5kaWFubmVzcyBiZWZvcmUKPiA+PiBj
YWxsaW5nXG4iLAo+ID4+ICsJCQkgX19mdW5jX18pOyAgCj4gPiAgCj4gPiBUaGUgYWJvdmUgcHJf
YWxlcnQoKSBjYWxscyBzb3VuZCB3ZWlyZC4gV2h5IGFyZSB5b3UgdW5jb25kaXRpb25hbGx5Cj4g
PiBjYWxsaW5nIGl0IChhbmQgc3RpbGwgZG9pbmcgdGhlIEJFIGNvbnZlcnNpb24pIGZvciBhbGwK
PiA+IFJFR0lTVFJBVElPTl9ERVNDUklQVE9SIHR5cGVzPyAgCj4gCj4gVG8gYmUgaG9uZXN0LCBJ
IGRpZCBub3Qga25vdyB3aGF0IHRvIGRvLiBIZXJlJ3Mgd2hhdCAxMzgxOC0xIGhhcyB0byBzYXkK
PiBhYm91dCByZWdpc3RyYXRpb24gZGVzY3JpcHRvcnM6Cj4gCj4gPjIuNi45Cj4gPiBTZW1hbnRp
YyBkZWZpbml0aW9uIG9mIGZpZWxkcyBpbiByZWdpc3RyYXRpb24gZGVzY3JpcHRvcgo+ID5mb3Jt
YXRfaWRlbnRpZmllciDigJMgVGhlIGZvcm1hdF9pZGVudGlmaWVyIGlzIGEgMzItYml0IHZhbHVl
IG9idGFpbmVkCj4gPmZyb20gYSBSZWdpc3RyYXRpb24gQXV0aG9yaXR5IGFzIGRlc2lnbmF0ZWQg
YnkKPiA+SVNPL0lFQyBKVEMgMS9TQyAyOS4KPiA+YWRkaXRpb25hbF9pZGVudGlmaWNhdGlvbl9p
bmZvIOKAkyBUaGUgbWVhbmluZyBvZgo+ID5hZGRpdGlvbmFsX2lkZW50aWZpY2F0aW9uX2luZm8g
Ynl0ZXMsIGlmIGFueSwgYXJlIGRlZmluZWQgYnkgdGhlCj4gPmFzc2lnbmVlIG9mIHRoYXQgZm9y
bWF0X2lkZW50aWZpZXIsIGFuZCBvbmNlIGRlZmluZWQgdGhleSBzaGFsbCBub3QgY2hhbmdlLiAg
Cj4gCj4gU28gSSB0b29rIHRoZSBjdWUgZnJvbSBsaWJkdmJ2NSBhbmQgZGVmaW5lZCB0aGUgZm9s
bG93aW5nIHN0cnVjdCBmb3IgaXQsCj4gd2l0aCBhIGZsZXhpYmxlIGFycmF5IG1lbWJlciBhdCB0
aGUgZW5kOgoKQW5kcsOpICh3aG8gcmUtd3JvdGUgdGhlIGxpYmR2YnY1IHBhcnNlcnMgdG8gYmUg
bW9yZSBnZW5lcmljKQpwcmVmZXJyZWQgdGhlIGFwcHJvYWNoIG9mIGtlZXBpbmcgdGhlIHN0cnVj
dHMgaW4gQ1BVLWVuZGlhbiwgYXMgaXQKbWFrZXMgZWFzaWVyIGZyb20gYXBwbGljYXRpb24gUG9W
LCBhcyB0aGUgY29udmVyc2lvbiBoYXBwZW5zIG9ubHkgb25jZQphdCB0aGUgbGlicmFyeS4KClRo
YXQncyBub3QgdGhlIGNhc2UgaGVyZS4gV2UgY2FuIGZpbGwgdGhlIHN0cnVjdHMgaW4gYmlnIGVu
ZGlhbiwKY29udmVydGluZyB0byBDUFUtZW5kaWFuIG9ubHkgb24gdGhlIGZldyBwbGFjZXMgd2Ug
bWF5IG5lZWQgdG8gcmVhZApiYWNrIGZyb20gaXQuCgo+IAo+IHN0cnVjdCB2aWR0dl9wc2lfZGVz
Y19yZWdpc3RyYXRpb24gewo+IAl1OCB0eXBlOwo+IAl1OCBsZW5ndGg7Cj4gCXN0cnVjdCB2aWR0
dl9wc2lfZGVzYyAqbmV4dDsKPiAKPiAJLyoKPiAJICogVGhlIGZvcm1hdF9pZGVudGlmaWVyIGlz
IGEgMzItYml0IHZhbHVlIG9idGFpbmVkIGZyb20gYSBSZWdpc3RyYXRpb24KPiAJICogQXV0aG9y
aXR5IGFzIGRlc2lnbmF0ZWQgYnkgSVNPL0lFQyBKVEMgMS9TQyAyOS4KPiAJICovCj4gCXUzMiBm
b3JtYXRfaWRlbnRpZmllcjsKPiAJLyoKPiAJICogVGhlIG1lYW5pbmcgb2YgYWRkaXRpb25hbF9p
ZGVudGlmaWNhdGlvbl9pbmZvIGJ5dGVzLCBpZiBhbnksIGFyZQo+IAkgKiBkZWZpbmVkIGJ5IHRo
ZSBhc3NpZ25lZSBvZiB0aGF0IGZvcm1hdF9pZGVudGlmaWVyLCBhbmQgb25jZSBkZWZpbmVkCj4g
CSAqIHRoZXkgc2hhbGwgbm90IGNoYW5nZS4KPiAJICovCj4gCXU4IGFkZGl0aW9uYWxfaWRlbnRp
ZmljYXRpb25faW5mb1tdOwo+IH0gX19wYWNrZWQKPiAKPiAKPiBBcyB5b3Uga25vdywgSSB3YXMg
Y2hhbmdpbmcgdGhlIGVuZGlhbm5lc3MgZnJvbSBob3N0IHRvIEJFIGJlZm9yZQo+IHNlcmlhbGl6
aW5nIGFuZCB0aGVuIGNoYW5naW5nIGJhY2sgZnJvbSBCRSB0byBob3N0LiBHaXZlbiB0aGUgc3Ry
dWN0Cj4gZGVmaW5pdGlvbiBhYm92ZSwgdGhlcmUgd2FzIG5vIHdheSB0byBkbyB0aGlzIHRvIHRo
ZQo+ICdhZGRpdGlvbmFsX2lkZW50aWZpY2F0aW9uX2luZm8nIG1lbWJlciwgc2luY2Ugd2UgZG8g
bm90IGtub3cgaXRzIGxheW91dC4KPiAKPiBJZiB3ZSBnbyB3aXRoIHlvdXIgYXBwcm9hY2ggaW5z
dGVhZCAoaS5lLiB1c2luZyBfX2JlMTYsIF9fYmUzMi4uLmV0YykKPiB0aGVuIEkgdGhpbmsgd2Ug
Y2FuIHJlbW92ZSB0aGVzZSB0d28gZnVuY3Rpb25zIChhbmQgbW9yZSkKClllcC4gCgpUaGFua3Ms
Ck1hdXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0
cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
