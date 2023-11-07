Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ED1C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 17:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8BC81EB5;
	Tue,  7 Nov 2023 17:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A8BC81EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiRSpGE6Rs3h; Tue,  7 Nov 2023 17:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 401C2817AE;
	Tue,  7 Nov 2023 17:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 401C2817AE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CCA3C0039;
	Tue,  7 Nov 2023 17:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 574ADC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB6C61401
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACB6C61401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfK3AnX8L80z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:38:52 +0000 (UTC)
X-Greylist: delayed 602 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 07 Nov 2023 17:38:52 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9480A61029
Received: from 8.mo584.mail-out.ovh.net (8.mo584.mail-out.ovh.net
 [188.165.33.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9480A61029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:38:52 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.122])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id C70CD28AE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:20:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ch27t (unknown [10.110.171.220])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3002E1FD2F;
 Tue,  7 Nov 2023 17:20:10 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-ch27t with ESMTPSA
 id sbZmCcpxSmVvfwEAiK7Wbg
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 17:20:10 +0000
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 19:20:09 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers core: lookup sysfs power group before removal
In-Reply-To: <2023110706-mustiness-arbitrary-fc9f@gregkh>
References: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
 <2023110139-dupe-snipping-5700@gregkh>
 <835b2930c710381b8da38eca821aa92d@foxhound.fi>
 <2023110353-bring-contented-c9f8@gregkh>
 <e13104c9e55b0bd8eee0a333b3ed7975@foxhound.fi>
 <2023110706-mustiness-arbitrary-fc9f@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <e8dccfb0ec240014a98660493aa34fc2@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 45.141.215.21
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 8199366075018552835
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddujedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpgeehrddugedurddvudehrddvuddpudehuddrkedtrddvledrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
Cc: len.brown@intel.com, linux-pm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com, pavel@ucw.cz,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMjAyMy0xMS0wNyAxMTo1MywgR3JlZyBLSCB3cm90ZToKPiBPbiBUdWUsIE5vdiAwNywgMjAy
MyBhdCAxMDo1NjoyMEFNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBPbiAyMDIz
LTExLTAzIDIwOjM2LCBHcmVnIEtIIHdyb3RlOgo+PiA+IE9uIEZyaSwgTm92IDAzLCAyMDIzIGF0
IDA3OjQ5OjM5UE0gKzAyMDAsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4+ID4gPiBPbiAyMDIz
LTExLTAxIDE5OjU0LCBHcmVnIEtIIHdyb3RlOgo+PiA+ID4gPiBPbiBXZWQsIE5vdiAwMSwgMjAy
MyBhdCAwNzozNjoyN1BNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiA+ID4gPiA+
IEhpbnRlZCBieSBzeXpib290LCB0aGVyZSBpcyBhIGZldyBjYXNlcyB3aGVyZSB0aGUgc3lzZnMg
cG93ZXIgZ3JvdXAKPj4gPiA+ID4gPiBtYXkKPj4gPiA+ID4gPiBub3QgYmUgdGhlcmUsIGxpa2Ug
dGhlIGZhaWx1cmUgd2hpbGUgYWRkaW5nIGl0LCBvciBhZGRpbmcgaXRzIHJ1bnRpbWUKPj4gPiA+
ID4gPiBncm91cCwgb3Igd2hlbiB0aGUgc3lzZnMgZmlybXdhcmUgbG9hZGVyIGZhbGxiYWNrIGZh
aWwgdG8gcG9wdWxhdGUuIEluCj4+ID4gPiA+ID4gdGhlIGxhc3QgY2FzZSwgdGhlIGRldmljZV9k
ZWwgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgbGVhZGluZyB0bwo+PiA+ID4gPiA+IGF0dGVtcHQK
Pj4gPiA+ID4gPiB0byByZW1vdmUgdGhlIHN5c2ZzIGdyb3VwLiBUaGlzIHBhdGNoIHdpbGwgbG9v
a3VwIGZvciBpdCBpbiBhZHZhbmNlIHRvCj4+ID4gPiA+ID4gZ3JhbnQgdGhhdCBpdCBpcyBlZmZl
Y3RpdmVseSB0aGVyZSBiZWZvcmUgY2xlYW5pbmcgaXQgdXAuCj4+ID4gPiA+ID4KPj4gPiA+ID4g
PiBSZXBvcnRlZC1ieTogc3l6Ym90Kzk1ZjJlMjQzOWI5NzU3NWVjM2MwQHN5emthbGxlci5hcHBz
cG90bWFpbC5jb20KPj4gPiA+ID4gPgo+PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3VuZC5maT4KPj4gPiA+ID4gPiAtLS0KPj4g
PiA+ID4gPiAgZHJpdmVycy9iYXNlL3Bvd2VyL3N5c2ZzLmMgfCA0ICsrKy0KPj4gPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiA+ID4gPiA+
Cj4+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wb3dlci9zeXNmcy5jIGIvZHJp
dmVycy9iYXNlL3Bvd2VyL3N5c2ZzLmMKPj4gPiA+ID4gPiBpbmRleCBhMTQ3NGZiNjdkYjkuLjY2
MDE3MjljNDY5OCAxMDA2NDQKPj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Jhc2UvcG93ZXIvc3lz
ZnMuYwo+PiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvYmFzZS9wb3dlci9zeXNmcy5jCj4+ID4gPiA+
ID4gQEAgLTgzNCw1ICs4MzQsNyBAQCB2b2lkIGRwbV9zeXNmc19yZW1vdmUoc3RydWN0IGRldmlj
ZSAqZGV2KQo+PiA+ID4gPiA+ICAJZGV2X3BtX3Fvc19jb25zdHJhaW50c19kZXN0cm95KGRldik7
Cj4+ID4gPiA+ID4gIAlycG1fc3lzZnNfcmVtb3ZlKGRldik7Cj4+ID4gPiA+ID4gIAlzeXNmc191
bm1lcmdlX2dyb3VwKCZkZXYtPmtvYmosICZwbV93YWtldXBfYXR0cl9ncm91cCk7Cj4+ID4gPiA+
ID4gLQlzeXNmc19yZW1vdmVfZ3JvdXAoJmRldi0+a29iaiwgJnBtX2F0dHJfZ3JvdXApOwo+PiA+
ID4gPiA+ICsKPj4gPiA+ID4gPiArCWlmIChrZXJuZnNfZmluZF9hbmRfZ2V0KCgmZGV2LT5rb2Jq
KS0+c2QsIHBtX2F0dHJfZ3JvdXAubmFtZSkpCj4+ID4gPiA+ID4gKwkJc3lzZnNfcmVtb3ZlX2dy
b3VwKCZkZXYtPmtvYmosICZwbV9hdHRyX2dyb3VwKTsKPj4gPiA+ID4KPj4gPiA+ID4gV2hhdCdz
IHRvIGtlZXAgaXQgZnJvbSBnb2luZyBhd2F5IHJpZ2h0IGFmdGVyIGZpbmRpbmcgaXQ/Cj4+ID4g
PiA+Cj4+ID4gPiA+IEluIG90aGVyIHdvcmRzLCB3aGF0IGlzIHdyb25nIHdpdGggcmVtb3Zpbmcg
YSBncm91cCB0aGF0IGlzIG5vdCB0aGVyZT8KPj4gPiA+ID4gV2hhdCBlcnJvciBoYXBwZW5zPyAg
SXQgc2hvdWxkIGJlIGZpbmUsIG9yIGFyZSB5b3Ugc2VlaW5nIHJlYWwgY29kZQo+PiA+ID4gPiBm
YWlsdXJlcyBzb21ld2hlcmU/Cj4+ID4gPgo+PiA+ID4gICAgIE5vLCB0aGlzIGlzIGp1c3QgaGl0
dGluZyBhIHdhcm5pbmcgdGhhdCBzeXNib3QgY29tcGxhaW5zIGFib3V0IGJ5Cj4+ID4gPiBzZXR0
aW5nIHBhbmljIG9uIHdhcm5pbmcsIG5vIGJpZyBkZWFsLCB0aG91Z2ggaXQgY2FuIGJlIGEgd3Jv
bmcKPj4gPiA+IGJlaGF2aW91cgo+PiA+ID4gaW4gdWVhZ2xlLWF0bSBkcml2ZXIsIHNpbmNlIGl0
IGRlZmluZXMgdG8gZGlzY29ubmVjdCB0aGUgZGV2aWNlIGlmIHRoZQo+PiA+ID4gZmlybXdhcmUg
aXMgbm90IHRoZXJlLCBubyBtYXR0ZXIgdGhlIHN5c2ZzIGZhbGxiYWNrLgo+PiA+Cj4+ID4gVGhl
biBmaXggdGhlIGRyaXZlciBwbGVhc2UuCj4+IAo+PiAgICAgSSdtIGFmcmFpZCBJIHdhcyB3cm9u
ZyBpbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBwcm9iZSByZXR1cm4gCj4+IHZhbHVlCj4+IG9m
IHRoZSBkcml2ZXIgd291bGQgaW5mbHVlbmNlIHRoZSB0ZXN0aW5nIHJlc3VsdCwgc28gdGhpcyBu
byBsb25nZXIgCj4+IHNlZW1zCj4+IGZpeGFibGUgZnJvbSBkcml2ZXIgc2lkZS4KPiAKPiBXaHkg
aXMgaXQgbm90IGZpeGFibGUgZnJvbSB0aGUgZHJpdmVyIHNpZGU/ICBJdCBpcyB0aGUgY29kZSB0
aGF0IGlzCj4gY3JlYXRpbmcsIGFuZCB0aGVuIHJlbW92aW5nLCB0aGUgZmlsZXMsIG5vdCB0aGUg
ZHJpdmVyIGNvcmUsIG9yIGFtIEkKPiBtaXNzaW5nIHNvbWV0aGluZyBoZXJlPwoKICAgICBJIGRv
bid0IHRoaW5rIHRoaXMgaXMgbXVjaCBvZiBhIHByb2JsZW0gc2luY2UgdGhlIHNpdHVhdGlvbiBp
cyAKdW5saWtlbHkgdG8KaGFwcGVuLiBUaGUgcmVwcm9kdWNlciBpcyBhdHRlbXB0aW5nIHRvIHJl
Z2lzdGVyIGEgc2ltdWxhdGVkIHVlYWdsZSAKbW9kZW0gYW5kCmNoZWNrcyBpZiB0aGUgZGV2aWNl
IGJlY29tZXMgcmVhZHkuIElmIGl0IGRvZXNuJ3QgZm9yIGFueSByZWFzb24sIGluIAp0aGlzIGNh
c2UsCnRoZSBsYWNrIG9mIHRoZSBmaXJtd2FyZSwgaXQganVzdCBkaXNjb25uZWN0IGl0IGFuZCB0
cnkgdG8gcG9wdWxhdGUgaXQgCmFnYWluLgpBZnRlciBhIGZldyBtaW51dGVzIGJhbmdpbmcgdGhl
IGtlcm5lbCB0aGlzIHdheSBpdCBoaXRzIHRoZSBzaXR1YXRpb24gCndoZXJlIHRoZQphc3luY2hy
b25vdXMgZmlybXdhcmUgbG9hZGVyIGRpZG4ndCB5ZXQgcG9wdWxhdGUgdGhlIHN5c2ZzIGZpbGVz
IGJlZm9yZSAKdGhlCmRldmljZSBpcyBnZXR0aW5nIHJlbW92ZWQsIGFuZCBoaXQgdGhlIHdhcm5p
bmcgb2YgbWlzc2luZyB0aGUgcG93ZXIgCmF0dHJpYnV0ZXMKaW4gc3lzZnMsIHdoaWxlIHJlbW92
aW5nIHRoZSBzeXNmcyBncm91cHMuIElmIGl0IGlzIGEgcHJvYmxlbSwgaXQgaXMgCmNlcnRhaW5s
eQpub3QgYSB0b3AgcHJpb3JpdHkgcHJvYmxlbSB0byBzb2x2ZSBmb3Igc3VyZS4KCiAgICAgSm9z
w6kuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
