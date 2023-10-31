Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E656DC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Oct 2023 12:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F45083A92;
	Tue, 31 Oct 2023 12:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F45083A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P_T3DmJAD2vi; Tue, 31 Oct 2023 12:58:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7001483A3A;
	Tue, 31 Oct 2023 12:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7001483A3A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5494BC0039;
	Tue, 31 Oct 2023 12:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20BB2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF48F41750
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF48F41750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyu1AyqDmwkO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:58:49 +0000 (UTC)
Received: from 14.mo584.mail-out.ovh.net (14.mo584.mail-out.ovh.net
 [46.105.40.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0426D41720
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0426D41720
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.20.107])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 99D6B2441D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 12:39:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ccsb6 (unknown [10.110.103.253])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 45CA71FD23;
 Tue, 31 Oct 2023 12:39:10 +0000 (UTC)
Received: from RCM-web9.webmail.mail.ovh.net ([151.80.29.21])
 by ghost-submission-6684bf9d7b-ccsb6 with ESMTPSA
 id oaz+C271QGXitwAArYvRAA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 31 Oct 2023 12:39:10 +0000
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 14:39:09 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: dmitry.torokhov@gmail.com, rydberg@bitmath.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Input: synaptics: enable InterTouch for ThinkPad L14 G1
In-Reply-To: <5d857ff972e9203ef65ae2396c7285c0@foxhound.fi>
References: <20231008080129.17931-1-jose.pekkarinen@foxhound.fi>
 <5d857ff972e9203ef65ae2396c7285c0@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <77a53e59cc4151c95942f37c88db8c75@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 192.42.116.198
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 17685072787369993833
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtvddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepjeduhefhveffueevfeejueeljeegvedtgffhheelffekjeeuteffkeethfekteejnecuffhomhgrihhnpehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgnecukfhppeduvdejrddtrddtrddupdduledvrdegvddrudduiedrudelkedpudehuddrkedtrddvledrvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
Cc: rrangel@chromium.org, linux-input@vger.kernel.org, amandhoot12@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMjAyMy0xMC0xNiAxODo1MSwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiBPbiAyMDIzLTEw
LTA4IDExOjAxLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBPYnNlcnZlZCBvbiBkbWVzZyBv
ZiBteSBsYXB0b3AgSSBzZWUgdGhlIGZvbGxvd2luZwo+PiBvdXRwdXQ6Cj4+IAo+PiBbICAgMTku
ODk4NzAwXSBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOiBxdWVyaWVkIG1heCBjb29yZGluYXRl
czogeAo+PiBbLi41Njc4XSwgeSBbLi40Njk0XQo+PiBbICAgMTkuOTM2MDU3XSBwc21vdXNlIHNl
cmlvMTogc3luYXB0aWNzOiBxdWVyaWVkIG1pbiBjb29yZGluYXRlczogeAo+PiBbMTI2Ni4uXSwg
eSBbMTE2Mi4uXQo+PiBbICAgMTkuOTM2MDc2XSBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOiBZ
b3VyIHRvdWNocGFkIChQTlA6IExFTjA0MTEKPj4gUE5QMGYxMykgc2F5cyBpdCBjYW4gc3VwcG9y
dCBhIGRpZmZlcmVudCBidXMuIElmIGkyYy1oaWQgYW5kIGhpZC1ybWkKPj4gYXJlIG5vdCB1c2Vk
LCB5b3UgbWlnaHQgd2FudCB0byB0cnkgc2V0dGluZwo+PiBwc21vdXNlLnN5bmFwdGljc19pbnRl
cnRvdWNoIHRvIDEgYW5kIHJlcG9ydCB0aGlzIHRvCj4+IGxpbnV4LWlucHV0QHZnZXIua2VybmVs
Lm9yZy4KPj4gWyAgIDIwLjAwODkwMV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogVG91Y2hw
YWQgbW9kZWw6IDEsIGZ3Ogo+PiAxMC4zMiwgaWQ6IDB4MWUyYTEsIGNhcHM6IDB4ZjAxNGEzLzB4
OTQwMzAwLzB4MTJlODAwLzB4NTAwMDAwLCBib2FyZAo+PiBpZDogMzQ3MSwgZncgaWQ6IDI5MDk2
NDAKPj4gWyAgIDIwLjAwODkyNV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogc2VyaW86IFN5
bmFwdGljcwo+PiBwYXNzLXRocm91Z2ggcG9ydCBhdCBpc2EwMDYwL3NlcmlvMS9pbnB1dDAKPj4g
WyAgIDIwLjA1MzM0NF0gaW5wdXQ6IFN5blBTLzIgU3luYXB0aWNzIFRvdWNoUGFkIGFzCj4+IC9k
ZXZpY2VzL3BsYXRmb3JtL2k4MDQyL3NlcmlvMS9pbnB1dC9pbnB1dDcKPj4gWyAgIDIwLjM5NzYw
OF0gbW91c2VkZXY6IFBTLzIgbW91c2UgZGV2aWNlIGNvbW1vbiBmb3IgYWxsIG1pY2UKPj4gCj4+
IFRoaXMgcGF0Y2ggd2lsbCBhZGQgaXRzIHBucCBpZCB0byB0aGUgc21idXMgbGlzdCB0bwo+PiBw
cm9kdWNlIHRoZSBzZXR1cCBvZiBpbnRlcnRvdWNoIGZvciB0aGUgZGV2aWNlLiBBZnRlcgo+PiBh
cHBseWluZywgdGhlIG91cHV0IHdpbGwgbG9vayBsaWtlOgo+PiAKPj4gWyAgIDE5LjE2ODY2NF0g
cHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogcXVlcmllZCBtYXggY29vcmRpbmF0ZXM6IHgKPj4g
Wy4uNTY3OF0sIHkgWy4uNDY5NF0KPj4gWyAgIDE5LjIwNjMxMV0gcHNtb3VzZSBzZXJpbzE6IHN5
bmFwdGljczogcXVlcmllZCBtaW4gY29vcmRpbmF0ZXM6IHgKPj4gWzEyNjYuLl0sIHkgWzExNjIu
Ll0KPj4gWyAgIDE5LjIwNjMyNV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogVHJ5aW5nIHRv
IHNldCB1cCBTTUJ1cyAKPj4gYWNjZXNzCj4+IFsgICAxOS4yMDk1NDVdIHBzbW91c2Ugc2VyaW8x
OiBzeW5hcHRpY3M6IFNNYnVzIGNvbXBhbmlvbiBpcyBub3QgcmVhZHkgCj4+IHlldAo+PiBbICAg
MTkuMjgzODQ1XSBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOiBUb3VjaHBhZCBtb2RlbDogMSwg
Znc6Cj4+IDEwLjMyLCBpZDogMHgxZTJhMSwgY2FwczogMHhmMDE0YTMvMHg5NDAzMDAvMHgxMmU4
MDAvMHg1MDAwMDAsIGJvYXJkCj4+IGlkOiAzNDcxLCBmdyBpZDogMjkwOTY0MAo+PiBbICAgMTku
MjgzODYzXSBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOiBzZXJpbzogU3luYXB0aWNzCj4+IHBh
c3MtdGhyb3VnaCBwb3J0IGF0IGlzYTAwNjAvc2VyaW8xL2lucHV0MAo+PiBbICAgMTkuMzI4OTU5
XSBpbnB1dDogU3luUFMvMiBTeW5hcHRpY3MgVG91Y2hQYWQgYXMKPj4gL2RldmljZXMvcGxhdGZv
cm0vaTgwNDIvc2VyaW8xL2lucHV0L2lucHV0OAo+PiBbICAgMTkuNzA2MTY0XSBtb3VzZWRldjog
UFMvMiBtb3VzZSBkZXZpY2UgY29tbW9uIGZvciBhbGwgbWljZQo+PiAKPj4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQGZveGhvdW5kLmZpPgo+PiAtLS0K
Pj4gIGRyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMgfCAxICsKPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvbW91
c2Uvc3luYXB0aWNzLmMgCj4+IGIvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYwo+PiBp
bmRleCBhZGEyOTllYzViYmEuLjM3NmEwNDFjODBiMiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9p
bnB1dC9tb3VzZS9zeW5hcHRpY3MuYwo+PiArKysgYi9kcml2ZXJzL2lucHV0L21vdXNlL3N5bmFw
dGljcy5jCj4+IEBAIC0xODMsNiArMTgzLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBz
bWJ1c19wbnBfaWRzW10gPSB7Cj4+ICAJIkxFTjAwOWIiLCAvKiBUNTgwICovCj4+ICAJIkxFTjA0
MDIiLCAvKiBYMSBFeHRyZW1lIEdlbiAyIC8gUDEgR2VuIDIgKi8KPj4gIAkiTEVOMDQwZiIsIC8q
IFAxIEdlbiAzICovCj4+ICsJIkxFTjA0MTEiLCAvKiBMMTQgR2VuIDEgKi8KPj4gIAkiTEVOMjAw
ZiIsIC8qIFQ0NTBzICovCj4+ICAJIkxFTjIwNDQiLCAvKiBMNDcwICAqLwo+PiAgCSJMRU4yMDU0
IiwgLyogRTQ4MCAqLwo+IAo+ICAgICBBbnkgY29tbWVudHMgaGVyZT8KPiAKPiAgICAgVGhhbmtz
IQo+IAo+ICAgICBKb3PDqS4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdAo+IExpbnV4LWtl
cm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKPiBodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwoK
ICAgICBQaW5nLgoKICAgICBKb3PDqS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtl
cm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
