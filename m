Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C28C11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 08:44:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3E861D05
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 08:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3E861D05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2444608BE;
	Wed, 30 Jun 2021 08:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8sEWAEmE8Vc; Wed, 30 Jun 2021 08:44:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C60C3608BA;
	Wed, 30 Jun 2021 08:44:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB823C001A;
	Wed, 30 Jun 2021 08:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CA95C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D79608C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buq7Itgqrez4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:44:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECEAD608BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:43:59 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BF226C0009;
 Wed, 30 Jun 2021 08:43:54 +0000 (UTC)
Date: Wed, 30 Jun 2021 10:43:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
Message-ID: <20210630104353.7575e920@xps13>
In-Reply-To: <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
References: <20210617160904.570111-1-desmondcheongzx@gmail.com>
 <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-mtd@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Christoph Hellwig <hch@lst.de>
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

SGVsbG8sCgpEZXNtb25kIENoZW9uZyBaaGkgWGkgPGRlc21vbmRjaGVvbmd6eEBnbWFpbC5jb20+
IHdyb3RlIG9uIFdlZCwgMzAgSnVuCjIwMjEgMTY6MDQ6MTcgKzA4MDA6Cgo+IE9uIDE4LzYvMjEg
MTI6MDkgYW0sIERlc21vbmQgQ2hlb25nIFpoaSBYaSB3cm90ZToKPiA+IFN5emJvdCByZXBvcnRl
ZCBhIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeToKPiA+IGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL2J1Zz9pZD03YmQxMDZjMjhlODQ2ZDEwMjNkNGNhOTE1NzE4YjFhMDkwNTQ0NGNi
Cj4gPiAKPiA+IFRoaXMgaGFwcGVucyBiZWNhdXNlIG9mIHRoZSBmb2xsb3dpbmcgbG9jayBkZXBl
bmRlbmNpZXM6Cj4gPiAKPiA+IDEuIGxvb3BfY3RsX211dGV4IC0+IGJkZXYtPmJkX211dGV4ICh3
aGVuIGxvb3BfY29udHJvbF9pb2N0bCBjYWxscwo+ID4gbG9vcF9yZW1vdmUsIHdoaWNoIHRoZW4g
Y2FsbHMgZGVsX2dlbmRpc2s7IHRoaXMgYWxzbyBoYXBwZW5zIGluCj4gPiBsb29wX2V4aXQgd2hp
Y2ggZXZlbnR1YWxseSBjYWxscyBsb29wX3JlbW92ZSkKPiA+IAo+ID4gMi4gYmRldi0+YmRfbXV0
ZXggLT4gbXRkX3RhYmxlX211dGV4ICh3aGVuIGJsa2Rldl9nZXRfYnlfZGV2IGNhbGxzCj4gPiBf
X2Jsa2Rldl9nZXQsIHdoaWNoIHRoZW4gY2FsbHMgYmxrdHJhbnNfb3BlbikKPiA+IAo+ID4gMy4g
bXRkX3RhYmxlX211dGV4IC0+IG1ham9yX25hbWVzX2xvY2sgKHdoZW4gcmVnaXN0ZXJfbXRkX2Js
a3RyYW5zCj4gPiBjYWxscyBfX3JlZ2lzdGVyX2Jsa2RldikKPiA+IAo+ID4gNC4gbWFqb3JfbmFt
ZXNfbG9jayAtPiBsb29wX2N0bF9tdXRleCAod2hlbiBibGtfcmVxdWVzdF9tb2R1bGUgY2FsbHMK
PiA+IGxvb3BfcHJvYmUpCj4gPiAKPiA+IEhlbmNlIHRoZXJlJ3MgYW4gb3ZlcmFsbCBkZXBlbmRl
bmN5IG9mOgo+ID4gCj4gPiBsb29wX2N0bF9tdXRleCAgIC0tLS0tLS0tLS0+IGJkZXYtPmJkX211
dGV4Cj4gPiAgICAgICAgXiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gPiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4gPiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2Cj4gPiBtYWpvcl9uYW1lc19sb2NrIDwtLS0tLS0tLS0gIG10ZF90YWJs
ZV9tdXRleAo+ID4gCj4gPiBXZSBjYW4gYnJlYWsgdGhpcyBjaXJjdWxhciBkZXBlbmRlbmN5IGJ5
IGhvbGRpbmcgbXRkX3RhYmxlX211dGV4IG9ubHkKPiA+IGZvciB0aGUgcmVxdWlyZWQgY3JpdGlj
YWwgc2VjdGlvbiBpbiByZWdpc3Rlcl9tdGRfYmxrdHJhbnMuIFRoaXMKPiA+IGF2b2lkcyB0aGUg
bXRkX3RhYmxlX211dGV4IC0+IG1ham9yX25hbWVzX2xvY2sgZGVwZW5kZW5jeS4KPiA+IAo+ID4g
UmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTogc3l6Ym90KzZhOGEwZDkzYzkxZThmYmYyZTgwQHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KPiA+IENvLWRldmVsb3BlZC1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KPiA+IFNpZ25lZC1vZmYtYnk6IERlc21vbmQgQ2hlb25nIFpoaSBYaSA8ZGVzbW9u
ZGNoZW9uZ3p4QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2VzIGluIHYxIC0+IHYy
Ogo+ID4gCj4gPiBCcmVhayB0aGUgY2lyY3VsYXIgZGVwZW5kZW5jeSBpbiByZWdpc3Rlcl9tdGRf
YmxrdHJhbnMgaW5zdGVhZCBvZiBibGtfcmVxdWVzdF9tb2R1bGUsIGFzIHN1Z2dlc3RlZCBieSBD
aHJpc3RvcGggSGVsbHdpZy4KPiA+IAo+ID4gICBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIHwg
OCArKy0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyBi
L2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiA+IGluZGV4IGZiOGUxMmQ1OTBhMS4uN2QyNmNm
ZTI0ZDA1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ID4gKysr
IGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ID4gQEAgLTUyOCwxNCArNTI4LDEwIEBAIGlu
dCByZWdpc3Rlcl9tdGRfYmxrdHJhbnMoc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyKQo+ID4g
ICAJaWYgKCFibGt0cmFuc19ub3RpZmllci5saXN0Lm5leHQpCj4gPiAgIAkJcmVnaXN0ZXJfbXRk
X3VzZXIoJmJsa3RyYW5zX25vdGlmaWVyKTsKPiA+ICAgPiAtCj4gPiAtCW11dGV4X2xvY2soJm10
ZF90YWJsZV9tdXRleCk7Cj4gPiAtCj4gPiAgIAlyZXQgPSByZWdpc3Rlcl9ibGtkZXYodHItPm1h
am9yLCB0ci0+bmFtZSk7Cj4gPiAgIAlpZiAocmV0IDwgMCkgewo+ID4gICAJCXByaW50ayhLRVJO
X1dBUk5JTkcgIlVuYWJsZSB0byByZWdpc3RlciAlcyBibG9jayBkZXZpY2Ugb24gbWFqb3IgJWQ6
ICVkXG4iLAo+ID4gICAJCSAgICAgICB0ci0+bmFtZSwgdHItPm1ham9yLCByZXQpOwo+ID4gLQkJ
bXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+ID4gICAJCXJldHVybiByZXQ7Cj4gPiAg
IAl9Cj4gPiAgID4gQEAgLTU0NSwxMiArNTQxLDEyIEBAIGludCByZWdpc3Rlcl9tdGRfYmxrdHJh
bnMoc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyKQo+ID4gICAJdHItPmJsa3NoaWZ0ID0gZmZz
KHRyLT5ibGtzaXplKSAtIDE7Cj4gPiAgID4gICAJSU5JVF9MSVNUX0hFQUQoJnRyLT5kZXZzKTsK
PiA+IC0JbGlzdF9hZGQoJnRyLT5saXN0LCAmYmxrdHJhbnNfbWFqb3JzKTsKPiA+ICAgPiArCW11
dGV4X2xvY2soJm10ZF90YWJsZV9tdXRleCk7Cj4gPiArCWxpc3RfYWRkKCZ0ci0+bGlzdCwgJmJs
a3RyYW5zX21ham9ycyk7Cj4gPiAgIAltdGRfZm9yX2VhY2hfZGV2aWNlKG10ZCkKPiA+ICAgCQlp
ZiAobXRkLT50eXBlICE9IE1URF9BQlNFTlQpCj4gPiAgIAkJCXRyLT5hZGRfbXRkKHRyLCBtdGQp
Owo+ID4gLQo+ID4gICAJbXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+ID4gICAJcmV0
dXJuIDA7Cj4gPiAgIH0KPiA+IAo+IAo+IEhpIG1haW50YWluZXJzLAo+IAo+IEFueSBjaGFuY2Ug
dG8gcmV2aWV3IHRoaXMgcGF0Y2g/Cj4gCj4gRm9yIGFkZGl0aW9uYWwgcmVmZXJlbmNlLCB0aGUg
bXRkX3RhYmxlX211dGV4IC0tPiBtYWpvcl9uYW1lc19sb2NrIGhpZXJhcmNoeSB0aGF0IGNhbiBi
ZSByZW1vdmVkIGJ5IHRoaXMgcGF0Y2ggYWxzbyBhcHBlYXJzIGluIGEgZGlmZmVyZW50IGxvY2sg
Y2hhaW46Cj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPWNiZjVmZTg0NmYx
NGE5MGYwNWUxMGRmMjAwYjA4YzU3OTQxZGM3NTAKCkknbSBmaW5lIHdpdGggdGhlIHBhdGNoLCBi
dXQgaXQgY2FtZSB0b28gbGF0ZSBpbiB0aGUgcmVsZWFzZSBjeWNsZSBzbwpub3cgSSdtIHdhaXRp
bmcgLXJjMSB0byBhcHBseSBpdC4KClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
