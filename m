Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464D0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 11:37:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18EDE20732
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 11:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18EDE20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0922A88610;
	Fri, 21 Aug 2020 11:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwbiDDxA3rQu; Fri, 21 Aug 2020 11:37:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EAC81885D3;
	Fri, 21 Aug 2020 11:37:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D93C1C0889;
	Fri, 21 Aug 2020 11:37:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 956AFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7C7C6204C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 11:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30r0GWKxToJ7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 11:37:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id CA491203E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 11:37:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F617B800;
 Fri, 21 Aug 2020 11:37:39 +0000 (UTC)
Date: Fri, 21 Aug 2020 13:37:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <20200821113710.GA26290@alley>
References: <20200817043028.76502-1-98.arpi@gmail.com>
 <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux-kselftest@vger.kernel.org,
 andriy.shevchenko@linux.intel.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_printf.c to
	KUnit
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

T24gTW9uIDIwMjAtMDgtMTcgMDk6MDY6MzIsIFJhc211cyBWaWxsZW1vZXMgd3JvdGU6Cj4gT24g
MTcvMDgvMjAyMCAwNi4zMCwgQXJwaXRoYSBSYWdodW5hbmRhbiB3cm90ZToKPiA+IENvbnZlcnRz
IHRlc3QgbGliL3Rlc3RfcHJpbnRmLmMgdG8gS1VuaXQuCj4gPiBNb3JlIGluZm9ybWF0aW9uIGFi
b3V0IEtVbml0IGNhbiBiZSBmb3VuZCBhdAo+ID4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvZGV2LXRvb2xzL2t1bml0L2luZGV4Lmh0bWwuCj4gPiBLVW5pdCBwcm92aWRl
cyBhIGNvbW1vbiBmcmFtZXdvcmsgZm9yIHVuaXQgdGVzdHMgaW4gdGhlIGtlcm5lbC4KPiAKPiBT
byBJIGNhbiBjb250aW51ZSB0byBidWlsZCBhIGtlcm5lbCB3aXRoIHNvbWUgYXBwcm9wcmlhdGUg
Q09ORklHIHNldCB0bwo+IHksIGJvb3QgaXQgdW5kZXIgdmlydC1tZSwgcnVuIGRtZXNnIGFuZCBz
ZWUgaWYgSSBicm9rZSBwcmludGY/IFRoYXQncwo+IHdoYXQgSSBkbyBub3csIGFuZCBJIGRvbid0
IHdhbnQgdG8gaGF2ZSB0byBzdGFydCB1c2luZyBzb21lIGVudGVycHJpc3kKPiBmcmFtZXdvcmsu
CgpJIGhhZCB0aGUgc2FtZSBjb25jZXJuLiBJIGhhdmUgdHJpZWQgaXQuIEl0IGNvbXBpbGVkIGEg
bW9kdWxlIGNhbGxlZApwcmludGZfa3VuaXQuYy4KCiAgICAjPiBtb2Rwcm9iZSBwcmludGZfa3Vu
aXQKCnByb2R1Y2VkIHRoZSBmb2xsb3dpbmcgaW4gZG1lc2c6CgpbICAgNjAuOTMxMTc1XSBwcmlu
dGZfa3VuaXQ6IG1vZHVsZSB2ZXJpZmljYXRpb24gZmFpbGVkOiBzaWduYXR1cmUgYW5kL29yIHJl
cXVpcmVkIGtleSBtaXNzaW5nIC0gdGFpbnRpbmcga2VybmVsClsgICA2MC45NDIyMDldIFRBUCB2
ZXJzaW9uIDE0ClsgICA2MC45NDUxOTddICAgICAjIFN1YnRlc3Q6IHByaW50Zi1rdW5pdC10ZXN0
ClsgICA2MC45NDUyMDBdICAgICAxLi4xClsgICA2MC45NTEwOTJdICAgICBvayAxIC0gc2VsZnRl
c3QKWyAgIDYwLjk1MzQxNF0gb2sgMSAtIHByaW50Zi1rdW5pdC10ZXN0CgpJIGNvdWxkIGxpdmUg
d2l0aCB0aGUgYWJvdmUuIFRoZW4gSSB0cmllZCB0byBicmVhayBhIHRlc3QgYnkgdGhlIGZvbGxv
d2luZyBjaGFuZ2U6CgoKZGlmZiAtLWdpdCBhL2xpYi9wcmludGZfa3VuaXQuYyBiL2xpYi9wcmlu
dGZfa3VuaXQuYwppbmRleCA2OGFjNWY5YjhkMjguLjE2ODlkYWRkNzBhMyAxMDA2NDQKLS0tIGEv
bGliL3ByaW50Zl9rdW5pdC5jCisrKyBiL2xpYi9wcmludGZfa3VuaXQuYwpAQCAtMzk1LDcgKzM5
NSw3IEBAIGlwNChzdHJ1Y3Qga3VuaXQgKmt1bml0dGVzdCkKICAgICAgICBzYS5zaW5fcG9ydCA9
IGNwdV90b19iZTE2KDEyMzQ1KTsKICAgICAgICBzYS5zaW5fYWRkci5zX2FkZHIgPSBjcHVfdG9f
YmUzMigweDdmMDAwMDAxKTsKIAotICAgICAgIHRlc3Qoa3VuaXR0ZXN0LCAiMTI3LjAwMC4wMDAu
MDAxfDEyNy4wLjAuMSIsICIlcGk0fCVwSTQiLCAmc2Euc2luX2FkZHIsICZzYS5zaW5fYWRkcik7
CisgICAgICAgdGVzdChrdW5pdHRlc3QsICIxMjctMDAwLjAwMC4wMDF8MTI3LjAuMC4xIiwgIiVw
aTR8JXBJNCIsICZzYS5zaW5fYWRkciwgJnNhLnNpbl9hZGRyKTsKICAgICAgICB0ZXN0KGt1bml0
dGVzdCwgIjEyNy4wMDAuMDAwLjAwMXwxMjcuMC4wLjEiLCAiJXBpU3wlcElTIiwgJnNhLCAmc2Ep
OwogICAgICAgIHNhLnNpbl9hZGRyLnNfYWRkciA9IGNwdV90b19iZTMyKDB4MDEwMjAzMDQpOwog
ICAgICAgIHRlc3Qoa3VuaXR0ZXN0LCAiMDAxLjAwMi4wMDMuMDA0OjEyMzQ1fDEuMi4zLjQ6MTIz
NDUiLCAiJXBpU3B8JXBJU3AiLCAmc2EsICZzYSk7CgoKSXQgcHJvZHVjZWQ6OgoKWyAgIDU2Ljc4
Njg1OF0gVEFQIHZlcnNpb24gMTQKWyAgIDU2Ljc4NzQ5M10gICAgICMgU3VidGVzdDogcHJpbnRm
LWt1bml0LXRlc3QKWyAgIDU2Ljc4NzQ5NF0gICAgIDEuLjEKWyAgIDU2Ljc4ODYxMl0gICAgICMg
c2VsZnRlc3Q6IEVYUEVDVEFUSU9OIEZBSUxFRCBhdCBsaWIvcHJpbnRmX2t1bml0LmM6NzYKICAg
ICAgICAgICAgICAgICAgIEV4cGVjdGVkIG1lbWNtcCh0ZXN0X2J1ZmZlciwgZXhwZWN0LCB3cml0
dGVuKSA9PSAwLCBidXQKICAgICAgICAgICAgICAgICAgICAgICBtZW1jbXAodGVzdF9idWZmZXIs
IGV4cGVjdCwgd3JpdHRlbikgPT0gMQogICAgICAgICAgICAgICAgICAgICAgIDAgPT0gMAogICAg
ICAgICAgICAgICB2c25wcmludGYoYnVmLCAyNTYsICIlcGk0fCVwSTQiLCAuLi4pIHdyb3RlICcx
MjcuMDAwLjAwMC4wMDF8MTI3LjAuMC4xJywgZXhwZWN0ZWQgJzEyNy0wMDAuMDAwLjAwMXwxMjcu
MC4wLjEnClsgICA1Ni43OTU0MzNdICAgICAjIHNlbGZ0ZXN0OiBFWFBFQ1RBVElPTiBGQUlMRUQg
YXQgbGliL3ByaW50Zl9rdW5pdC5jOjc2CiAgICAgICAgICAgICAgICAgICBFeHBlY3RlZCBtZW1j
bXAodGVzdF9idWZmZXIsIGV4cGVjdCwgd3JpdHRlbikgPT0gMCwgYnV0CiAgICAgICAgICAgICAg
ICAgICAgICAgbWVtY21wKHRlc3RfYnVmZmVyLCBleHBlY3QsIHdyaXR0ZW4pID09IDEKICAgICAg
ICAgICAgICAgICAgICAgICAwID09IDAKICAgICAgICAgICAgICAgdnNucHJpbnRmKGJ1ZiwgMjAs
ICIlcGk0fCVwSTQiLCAuLi4pIHdyb3RlICcxMjcuMDAwLjAwMC4wMDF8MTI3JywgZXhwZWN0ZWQg
JzEyNy0wMDAuMDAwLjAwMXwxMjcnClsgICA1Ni44MDA5MDldICAgICAjIHNlbGZ0ZXN0OiBFWFBF
Q1RBVElPTiBGQUlMRUQgYXQgbGliL3ByaW50Zl9rdW5pdC5jOjEwOAogICAgICAgICAgICAgICAg
ICAgRXhwZWN0ZWQgbWVtY21wKHAsIGV4cGVjdCwgZWxlbisxKSA9PSAwLCBidXQKICAgICAgICAg
ICAgICAgICAgICAgICBtZW1jbXAocCwgZXhwZWN0LCBlbGVuKzEpID09IDEKICAgICAgICAgICAg
ICAgICAgICAgICAwID09IDAKICAgICAgICAgICAgICAga3Zhc3ByaW50ZiguLi4sICIlcGk0fCVw
STQiLCAuLi4pIHJldHVybmVkICcxMjcuMDAwLjAwMC4wMDF8MTI3LjAuMC4xJywgZXhwZWN0ZWQg
JzEyNy0wMDAuMDAwLjAwMXwxMjcuMC4wLjEnClsgICA1Ni44MDY0OTddICAgICBub3Qgb2sgMSAt
IHNlbGZ0ZXN0ClsgICA1Ni44MDY0OTddIG5vdCBvayAxIC0gcHJpbnRmLWt1bml0LXRlc3QKCndo
aWxlIHRoZSBvcmlnaW5hbCBjb2RlIHdvdWxkIGhhdmUgd3JpdHRlbiB0aGUgZm9sbG93aW5nIGVy
cm9yIG1lc3NhZ2VzOgoKWyAgIDk1Ljg1OTIyNV0gdGVzdF9wcmludGY6IGxvYWRlZC4KWyAgIDk1
Ljg2MDAzMV0gdGVzdF9wcmludGY6IHZzbnByaW50ZihidWYsIDI1NiwgIiVwaTR8JXBJNCIsIC4u
Likgd3JvdGUgJzEyNy4wMDAuMDAwLjAwMXwxMjcuMC4wLjEnLCBleHBlY3RlZCAnMTI3LTAwMC4w
MDAuMDAxfDEyNy4wLjAuMScKWyAgIDk1Ljg2MjYzMF0gdGVzdF9wcmludGY6IHZzbnByaW50Zihi
dWYsIDYsICIlcGk0fCVwSTQiLCAuLi4pIHdyb3RlICcxMjcuMCcsIGV4cGVjdGVkICcxMjctMCcK
WyAgIDk1Ljg2NDExOF0gdGVzdF9wcmludGY6IGt2YXNwcmludGYoLi4uLCAiJXBpNHwlcEk0Iiwg
Li4uKSByZXR1cm5lZCAnMTI3LjAwMC4wMDAuMDAxfDEyNy4wLjAuMScsIGV4cGVjdGVkICcxMjct
MDAwLjAwMC4wMDF8MTI3LjAuMC4xJwpbICAgOTUuODY2NTg5XSB0ZXN0X3ByaW50ZjogZmFpbGVk
IDMgb3V0IG9mIDM4OCB0ZXN0cwoKCkV2ZW4gdGhlIGVycm9yIG91dHB1dCBpcyBhY2NlcHRhYmxl
IGZvciBtZS4gSSBhbSBqdXN0IGN1cmlvdXMgd2h5CnRoZSAybmQgZmFpbHVyZSBpcyBkaWZmZXJl
bnQ6CgogICArIG9yaWdpbmFsIGNvZGU6IHZzbnByaW50ZihidWYsIDYsICIlcGk0fCVwSTQiLCAu
Li4pIHdyb3RlICcxMjcuMCcsIGV4cGVjdGVkICcxMjctMCcKICAgKyBrdW5pdCBjb2RlOiB2c25w
cmludGYoYnVmLCAyMCwgIiVwaTR8JXBJNCIsIC4uLikgd3JvdGUgJzEyNy4wMDAuMDAwLjAwMXwx
MjcnLCBleHBlY3RlZCAnMTI3LTAwMC4wMDAuMDAxfDEyNycgICAKCgpJIGFtIGFsc28gYSBiaXQg
c2NhcmVkIGJ5IHRoZSBmb2xsb3dpbmcgbm90ZSBhdApodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9kZXYtdG9vbHMva3VuaXQvc3RhcnQuaHRtbCNydW5uaW5nLXRlc3RzLXdp
dGhvdXQtdGhlLWt1bml0LXdyYXBwZXIKCiAgICJLVW5pdCBpcyBub3QgZGVzaWduZWQgZm9yIHVz
ZSBpbiBhIHByb2R1Y3Rpb24gc3lzdGVtLCBhbmQgaXTigJlzCiAgIHBvc3NpYmxlIHRoYXQgdGVz
dHMgbWF5IHJlZHVjZSB0aGUgc3RhYmlsaXR5IG9yIHNlY3VyaXR5IG9mIHRoZQogICBzeXN0ZW0u
IgoKV2hhdCBkb2VzIGl0IG1lYW4gdGhheSBpdCBtaWdodCByZWR1Y2Ugc3RhYmlsaXR5IG9yIHNl
Y3VyaXR5PwpJcyBpdCBiZWNhdXNlIHRoZSB0ZXN0cyBtaWdodCBjYXVzZSBwcm9ibGVtcz8KT3Ig
YmVjYXVzZSB0aGUga3VuaXQgZnJhbWV3b3JrIG1vZGlmaWVzIGZ1bmN0aW9uYWxpdHkgb2YgdGhl
IHJ1bm5pbmcKc3lzdGVtIGFsbCB0aGUgdGltZT8KCgpCZXN0IFJlZ2FyZHMsClBldHIKClBTOiBJ
IHN0aWxsIGhhdmUgdG8gbG9vayBhdCB0aGUgY29kZS4gQW53eWF5LCB0aGUgY29tbWVudHMgZnJv
bSBSYXNtdXMgbWFrZQpzZW5zZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5l
bC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
