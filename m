Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B6AC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Oct 2023 12:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B085432D1;
	Sun, 29 Oct 2023 12:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B085432D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNCvtyop9gpv; Sun, 29 Oct 2023 12:33:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E94FB42EE3;
	Sun, 29 Oct 2023 12:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E94FB42EE3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B730BC0071;
	Sun, 29 Oct 2023 12:33:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2C15C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B70BB4EE8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B70BB4EE8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyKy_oTwsAr1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:33:33 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 29 Oct 2023 12:33:33 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBF04EE8C
Received: from 8.mo575.mail-out.ovh.net (8.mo575.mail-out.ovh.net
 [46.105.74.219])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EBF04EE8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:33:33 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.1.93])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 1A7AE26507
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 12:26:24 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zlzdz (unknown [10.110.171.220])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 136771FD23;
 Sun, 29 Oct 2023 12:26:23 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net ([176.31.235.81])
 by ghost-submission-6684bf9d7b-zlzdz with ESMTPSA
 id CCgfA29PPmWg6QAAfL0Qcw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Sun, 29 Oct 2023 12:26:23 +0000
MIME-Version: 1.0
Date: Sun, 29 Oct 2023 14:26:22 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] KVM: x86: cleanup unused variables
In-Reply-To: <20231029093859.138442-1-jose.pekkarinen@foxhound.fi>
References: <20231029093859.138442-1-jose.pekkarinen@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <411f0a96b86c08e85a02c7174a921138@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 192.42.116.212
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 5724075128479131302
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudelvddrgedvrdduudeirddvuddvpddujeeirdefuddrvdefhedrkedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
Cc: x86@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, hpa@zytor.com
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

T24gMjAyMy0xMC0yOSAxMTozOCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiBSZXBvcnRlZCBi
eSBjb2NjaW5lbGxlLCB0aGUgZm9sbG93aW5nIHBhdGNoIHdpbGwgcmVtb3ZlIHNvbWUKPiByZWR1
bmRhbnQgdmFyaWFibGVzLiBUaGlzIHBhdGNoIHdpbGwgYWRkcmVzcyB0aGUgZm9sbG93aW5nCj4g
d2FybmluZ3M6Cj4gCj4gYXJjaC94ODYva3ZtL2VtdWxhdGUuYzoxMzE1OjUtNzogVW5uZWVkZWQg
dmFyaWFibGU6ICJyYyIuIFJldHVybgo+ICJYODZFTVVMX0NPTlRJTlVFIiBvbiBsaW5lIDEzMzAK
PiBhcmNoL3g4Ni9rdm0vZW11bGF0ZS5jOjQ1NTc6NS03OiBVbm5lZWRlZCB2YXJpYWJsZTogInJj
Ii4gUmV0dXJuCj4gIlg4NkVNVUxfQ09OVElOVUUiIG9uIGxpbmUgNDU5MQo+IGFyY2gveDg2L2t2
bS9lbXVsYXRlLmM6MTE4MDo1LTc6IFVubmVlZGVkIHZhcmlhYmxlOiAicmMiLiBSZXR1cm4KPiAi
WDg2RU1VTF9DT05USU5VRSIgb24gbGluZSAxMjAyCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kg
UGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQGZveGhvdW5kLmZpPgo+IC0tLQo+ICBhcmNoL3g4
Ni9rdm0vZW11bGF0ZS5jIHwgMTcgKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS9lbXVsYXRlLmMgYi9hcmNoL3g4Ni9rdm0vZW11bGF0ZS5jCj4gaW5kZXggMjY3M2Nk
NWM0NmNiLi5jNGJiMDNhODhkZmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL2VtdWxhdGUu
Ywo+ICsrKyBiL2FyY2gveDg2L2t2bS9lbXVsYXRlLmMKPiBAQCAtMTE3Nyw3ICsxMTc3LDYgQEAg
c3RhdGljIGludCBkZWNvZGVfbW9kcm0oc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgCj4gKmN0eHQs
Cj4gIHsKPiAgCXU4IHNpYjsKPiAgCWludCBpbmRleF9yZWcsIGJhc2VfcmVnLCBzY2FsZTsKPiAt
CWludCByYyA9IFg4NkVNVUxfQ09OVElOVUU7Cj4gIAl1bG9uZyBtb2RybV9lYSA9IDA7Cj4gCj4g
IAljdHh0LT5tb2RybV9yZWcgPSAoKGN0eHQtPnJleF9wcmVmaXggPDwgMSkgJiA4KTsgLyogUkVY
LlIgKi8KPiBAQCAtMTE5OSwxNiArMTE5OCwxNiBAQCBzdGF0aWMgaW50IGRlY29kZV9tb2RybShz
dHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAKPiAqY3R4dCwKPiAgCQkJb3AtPmJ5dGVzID0gMTY7Cj4g
IAkJCW9wLT5hZGRyLnhtbSA9IGN0eHQtPm1vZHJtX3JtOwo+ICAJCQlrdm1fcmVhZF9zc2VfcmVn
KGN0eHQtPm1vZHJtX3JtLCAmb3AtPnZlY192YWwpOwo+IC0JCQlyZXR1cm4gcmM7Cj4gKwkJCXJl
dHVybiBYODZFTVVMX0NPTlRJTlVFOwo+ICAJCX0KPiAgCQlpZiAoY3R4dC0+ZCAmIE1teCkgewo+
ICAJCQlvcC0+dHlwZSA9IE9QX01NOwo+ICAJCQlvcC0+Ynl0ZXMgPSA4Owo+ICAJCQlvcC0+YWRk
ci5tbSA9IGN0eHQtPm1vZHJtX3JtICYgNzsKPiAtCQkJcmV0dXJuIHJjOwo+ICsJCQlyZXR1cm4g
WDg2RU1VTF9DT05USU5VRTsKPiAgCQl9Cj4gIAkJZmV0Y2hfcmVnaXN0ZXJfb3BlcmFuZChvcCk7
Cj4gLQkJcmV0dXJuIHJjOwo+ICsJCXJldHVybiBYODZFTVVMX0NPTlRJTlVFOwo+ICAJfQo+IAo+
ICAJb3AtPnR5cGUgPSBPUF9NRU07Cj4gQEAgLTEzMDYsMTQgKzEzMDUsMTIgQEAgc3RhdGljIGlu
dCBkZWNvZGVfbW9kcm0oc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgCj4gKmN0eHQsCj4gIAkJY3R4
dC0+bWVtb3AuYWRkci5tZW0uZWEgPSAodTMyKWN0eHQtPm1lbW9wLmFkZHIubWVtLmVhOwo+IAo+
ICBkb25lOgo+IC0JcmV0dXJuIHJjOwo+ICsJcmV0dXJuIFg4NkVNVUxfQ09OVElOVUU7Cj4gIH0K
PiAKPiAgc3RhdGljIGludCBkZWNvZGVfYWJzKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0
LAo+ICAJCSAgICAgIHN0cnVjdCBvcGVyYW5kICpvcCkKPiAgewo+IC0JaW50IHJjID0gWDg2RU1V
TF9DT05USU5VRTsKPiAtCj4gIAlvcC0+dHlwZSA9IE9QX01FTTsKPiAgCXN3aXRjaCAoY3R4dC0+
YWRfYnl0ZXMpIHsKPiAgCWNhc2UgMjoKPiBAQCAtMTMyNyw3ICsxMzI0LDcgQEAgc3RhdGljIGlu
dCBkZWNvZGVfYWJzKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0IAo+ICpjdHh0LAo+ICAJCWJyZWFr
Owo+ICAJfQo+ICBkb25lOgo+IC0JcmV0dXJuIHJjOwo+ICsJcmV0dXJuIFg4NkVNVUxfQ09OVElO
VUU7Cj4gIH0KPiAKPiAgc3RhdGljIHZvaWQgZmV0Y2hfYml0X29wZXJhbmQoc3RydWN0IHg4Nl9l
bXVsYXRlX2N0eHQgKmN0eHQpCj4gQEAgLTQ1NTQsOCArNDU1MSw2IEBAIHN0YXRpYyB1bnNpZ25l
ZCBpbW1fc2l6ZShzdHJ1Y3QgeDg2X2VtdWxhdGVfY3R4dCAKPiAqY3R4dCkKPiAgc3RhdGljIGlu
dCBkZWNvZGVfaW1tKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LCBzdHJ1Y3Qgb3BlcmFu
ZCAKPiAqb3AsCj4gIAkJICAgICAgdW5zaWduZWQgc2l6ZSwgYm9vbCBzaWduX2V4dGVuc2lvbikK
PiAgewo+IC0JaW50IHJjID0gWDg2RU1VTF9DT05USU5VRTsKPiAtCj4gIAlvcC0+dHlwZSA9IE9Q
X0lNTTsKPiAgCW9wLT5ieXRlcyA9IHNpemU7Cj4gIAlvcC0+YWRkci5tZW0uZWEgPSBjdHh0LT5f
ZWlwOwo+IEBAIC00NTg4LDcgKzQ1ODMsNyBAQCBzdGF0aWMgaW50IGRlY29kZV9pbW0oc3RydWN0
IHg4Nl9lbXVsYXRlX2N0eHQKPiAqY3R4dCwgc3RydWN0IG9wZXJhbmQgKm9wLAo+ICAJCX0KPiAg
CX0KPiAgZG9uZToKPiAtCXJldHVybiByYzsKPiArCXJldHVybiBYODZFTVVMX0NPTlRJTlVFOwo+
ICB9Cj4gCj4gIHN0YXRpYyBpbnQgZGVjb2RlX29wZXJhbmQoc3RydWN0IHg4Nl9lbXVsYXRlX2N0
eHQgKmN0eHQsIHN0cnVjdCAKPiBvcGVyYW5kICpvcCwKCiAgICAgU29ycnksIHRoaXMgaXMgYSBm
YWxzZSBwb3NpdGl2ZSwgcGxlYXNlIHNraXAgaXQuCgogICAgIEpvc8OpLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
