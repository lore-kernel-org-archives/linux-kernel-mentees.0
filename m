Return-Path: <SRS0=/sBJ=4M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14E4C38BFA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 21:18:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C20320CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Feb 2020 21:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C20320CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49DC786064;
	Mon, 24 Feb 2020 21:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyXYgaiT9yaj; Mon, 24 Feb 2020 21:18:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C481186061;
	Mon, 24 Feb 2020 21:18:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC064C07FF;
	Mon, 24 Feb 2020 21:18:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A188C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 21:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 93A5A86064
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 21:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBXkS2Cm4Npv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 21:18:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E72AA86061
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Feb 2020 21:18:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EA7BB121A82C0;
 Mon, 24 Feb 2020 13:18:01 -0800 (PST)
Date: Mon, 24 Feb 2020 13:18:01 -0800 (PST)
Message-Id: <20200224.131801.2179562246092982372.davem@davemloft.net>
To: frextrite@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200222063835.14328-2-frextrite@gmail.com>
References: <20200222063835.14328-1-frextrite@gmail.com>
 <20200222063835.14328-2-frextrite@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Feb 2020 13:18:02 -0800 (PST)
Cc: paulmck@kernel.org, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, madhuparnabhowmik10@gmail.com, kuba@kernel.org,
 joel@joelfernandes.org, kuznet@ms2.inr.ac.ru,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] ipmr: Add lockdep expression
 to ipmr_for_each_table macro
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
Content-Type: text/plain; charset="iso8859-7"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

RnJvbTogQW1vbCBHcm92ZXIgPGZyZXh0cml0ZUBnbWFpbC5jb20+DQpEYXRlOiBTYXQsIDIyIEZl
YiAyMDIwIDEyOjA4OjM2ICswNTMwDQoNCj4gaXBtcl9mb3JfZWFjaF90YWJsZSgpIHVzZXMgbGlz
dF9mb3JfZWFjaF9lbnRyeV9yY3UoKSBmb3INCj4gdHJhdmVyc2luZyBvdXRzaWRlIG9mIGFuIFJD
VSByZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlvbiBidXQNCj4gdW5kZXIgdGhlIHByb3RlY3Rpb24g
b2YgcGVybmV0X29wc19yd3NlbS4gSGVuY2UgYWRkIHRoZQ0KPiBjb3JyZXNwb25kaW5nIGxvY2tk
ZXAgZXhwcmVzc2lvbiB0byBzaWxlbmNlIHRoZSBmb2xsb3dpbmcNCj4gZmFsc2UtcG9zaXRpdmUg
d2FybmluZyBhdCBib290Og0KPiANCj4gWyAgICAwLjY0NTI5Ml0gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gWyAgICAwLjY0NTI5NF0gV0FSTklORzogc3VzcGljaW91cyBSQ1UgdXNh
Z2UNCj4gWyAgICAwLjY0NTI5Nl0gNS41LjQtc3RhYmxlICMxNyBOb3QgdGFpbnRlZA0KPiBbICAg
IDAuNjQ1Mjk3XSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBbICAgIDAuNjQ1Mjk5
XSBuZXQvaXB2NC9pcG1yLmM6MTM2IFJDVS1saXN0IHRyYXZlcnNlZCBpbiBub24tcmVhZGVyIHNl
Y3Rpb24hIQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW1vbCBHcm92ZXIgPGZyZXh0cml0ZUBnbWFp
bC5jb20+DQoNClRoaXMgcGF0Y2ggc2VyaWVzIGNhdXNlcyBidWlsZCBwcm9ibGVtcywgcGxlYXNl
IGZpeCBhbmQgcmVzdWJtaXQgdGhlIGVudGlyZQ0Kc2VyaWVzOg0KDQpbZGF2ZW1AbG9jYWxob3N0
IG5ldC1uZXh0XSQgbWFrZSBuZXQvaXB2NC9pcG1yLm8gDQogIENBTEwgICAgc2NyaXB0cy9jaGVj
a3N5c2NhbGxzLnNoDQogIENBTEwgICAgc2NyaXB0cy9hdG9taWMvY2hlY2stYXRvbWljcy5zaA0K
ICBERVNDRU5EICBvYmp0b29sDQogIENDICAgICAgbmV0L2lwdjQvaXBtci5vDQpJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L3JjdWxpc3QuaDoxMSwNCiAgICAgICAgICAgICAg
ICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcGlkLmg6NSwNCiAgICAgICAgICAgICAgICAgZnJvbSAu
L2luY2x1ZGUvbGludXgvc2NoZWQuaDoxNCwNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1
ZGUvbGludXgvdWFjY2Vzcy5oOjUsDQogICAgICAgICAgICAgICAgIGZyb20gbmV0L2lwdjQvaXBt
ci5jOjI0Og0KbmV0L2lwdjQvaXBtci5jOiBJbiBmdW5jdGlvbiChaXBtcl9nZXRfdGFibGWiOg0K
Li9pbmNsdWRlL2xpbnV4L3JjdWxpc3QuaDo2MzoyNTogd2FybmluZzogc3VnZ2VzdCBwYXJlbnRo
ZXNlcyBhcm91bmQgoSYmoiB3aXRoaW4goXx8oiBbLVdwYXJlbnRoZXNlc10NCiAgUkNVX0xPQ0tE
RVBfV0FSTighY29uZCAmJiAhcmN1X3JlYWRfbG9ja19hbnlfaGVsZCgpLCAgXA0KLi9pbmNsdWRl
L2xpbnV4L3JjdXBkYXRlLmg6MjYzOjUyOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIKFS
Q1VfTE9DS0RFUF9XQVJOog0KICAgaWYgKGRlYnVnX2xvY2tkZXBfcmN1X2VuYWJsZWQoKSAmJiAh
X193YXJuZWQgJiYgKGMpKSB7IFwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeDQouL2luY2x1ZGUvbGludXgvcmN1bGlzdC5oOjM4MTo3OiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8goV9fbGlzdF9jaGVja19yY3WiDQogIGZvciAoX19saXN0
X2NoZWNrX3JjdShkdW1teSwgIyMgY29uZCwgMCksICAgXA0KICAgICAgIF5+fn5+fn5+fn5+fn5+
fn4NCm5ldC9pcHY0L2lwbXIuYzoxMTM6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIKFs
aXN0X2Zvcl9lYWNoX2VudHJ5X3JjdaINCiAgbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UobXJ0LCAm
bmV0LT5pcHY0Lm1yX3RhYmxlcywgbGlzdCwgXA0KICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0K
bmV0L2lwdjQvaXBtci5jOjEzODoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8goWlwbXJf
Zm9yX2VhY2hfdGFibGWiDQogIGlwbXJfZm9yX2VhY2hfdGFibGUobXJ0LCBuZXQpIHsNCiAgXn5+
fn5+fn5+fn5+fn5+fn5+fg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1t
ZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
