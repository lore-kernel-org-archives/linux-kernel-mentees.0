Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AE3C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 20:43:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA3002237B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 20:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA3002237B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2BA5286EA3;
	Wed, 21 Oct 2020 20:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dad6WNBSE43C; Wed, 21 Oct 2020 20:43:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E646186E1D;
	Wed, 21 Oct 2020 20:43:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB7AFC08A1;
	Wed, 21 Oct 2020 20:43:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 737A1C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6E9FE874C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYuRz1For8JT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:43:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0136.hostedemail.com
 [216.40.44.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E6986874C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:43:19 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 5A82B1802915E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 20:37:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 57D7B181D3058;
 Wed, 21 Oct 2020 20:36:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: verse65_2d0591e2724b
X-Filterd-Recvd-Size: 2997
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Wed, 21 Oct 2020 20:36:58 +0000 (UTC)
Message-ID: <05ace32973590e28f62ccddfd7874cf1fcaca8b1.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>
Date: Wed, 21 Oct 2020 13:36:57 -0700
In-Reply-To: <5bacf91085ce7e253b2697333dc8ff0378fcfae9.camel@perches.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <0562c42d-f9af-1141-ab77-8abb73bfd31f@gmail.com>
 <5bacf91085ce7e253b2697333dc8ff0378fcfae9.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

T24gV2VkLCAyMDIwLTEwLTIxIGF0IDEyOjI2IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKCj4g
UGVyaGFwcyBhIHJlZ2V4IGZvciBwZXJtaXNzaW9ucyBpcyBnb29kIGVub3VnaAo+IAkkbGluZSAh
fiAvXGJbY2JkbC1dW3J3eHMtXXs5LDl9XGIvCgpNYXliZSBub3QgY29tcGxldGVseSBjb3JyZWN0
Li4uCgpGcm9tIGluZm8gbHM6CgogICAgVGhlIGZpbGUgdHlwZSBpcyBvbmUgb2YgdGhlIGZvbGxv
d2luZyBjaGFyYWN0ZXJzOgoKICAgICDigJgt4oCZCiAgICAgICAgICByZWd1bGFyIGZpbGUKICAg
ICDigJhi4oCZCiAgICAgICAgICBibG9jayBzcGVjaWFsIGZpbGUKICAgICDigJhj4oCZCiAgICAg
ICAgICBjaGFyYWN0ZXIgc3BlY2lhbCBmaWxlCiAgICAg4oCYQ+KAmQogICAgICAgICAgaGlnaCBw
ZXJmb3JtYW5jZSAo4oCcY29udGlndW91cyBkYXRh4oCdKSBmaWxlCiAgICAg4oCYZOKAmQogICAg
ICAgICAgZGlyZWN0b3J5CiAgICAg4oCYROKAmQogICAgICAgICAgZG9vciAoU29sYXJpcyAyLjUg
YW5kIHVwKQogICAgIOKAmGzigJkKICAgICAgICAgIHN5bWJvbGljIGxpbmsKICAgICDigJhN4oCZ
CiAgICAgICAgICBvZmYtbGluZSAo4oCcbWlncmF0ZWTigJ0pIGZpbGUgKENyYXkgRE1GKQogICAg
IOKAmG7igJkKICAgICAgICAgIG5ldHdvcmsgc3BlY2lhbCBmaWxlIChIUC1VWCkKICAgICDigJhw
4oCZCiAgICAgICAgICBGSUZPIChuYW1lZCBwaXBlKQogICAgIOKAmFDigJkKICAgICAgICAgIHBv
cnQgKFNvbGFyaXMgMTAgYW5kIHVwKQogICAgIOKAmHPigJkKICAgICAgICAgIHNvY2tldAogICAg
IOKAmD/igJkKICAgICAgICAgIHNvbWUgb3RoZXIgZmlsZSB0eXBlCgogICAgIFRoZSBmaWxlIG1v
ZGUgYml0cyBsaXN0ZWQgYXJlIHNpbWlsYXIgdG8gc3ltYm9saWMgbW9kZQogICAgIHNwZWNpZmlj
YXRpb25zICgqbm90ZSBTeW1ib2xpYyBNb2Rlczo6KS4gIEJ1dCDigJhsc+KAmSBjb21iaW5lcwog
ICAgIG11bHRpcGxlIGJpdHMgaW50byB0aGUgdGhpcmQgY2hhcmFjdGVyIG9mIGVhY2ggc2V0IG9m
IHBlcm1pc3Npb25zCiAgICAgYXMgZm9sbG93czoKCiAgICAg4oCYc+KAmQogICAgICAgICAgSWYg
dGhlIHNldC11c2VyLUlEIG9yIHNldC1ncm91cC1JRCBiaXQgYW5kIHRoZSBjb3JyZXNwb25kaW5n
CiAgICAgICAgICBleGVjdXRhYmxlIGJpdCBhcmUgYm90aCBzZXQuCgogICAgIOKAmFPigJkKICAg
ICAgICAgIElmIHRoZSBzZXQtdXNlci1JRCBvciBzZXQtZ3JvdXAtSUQgYml0IGlzIHNldCBidXQg
dGhlCiAgICAgICAgICBjb3JyZXNwb25kaW5nIGV4ZWN1dGFibGUgYml0IGlzIG5vdCBzZXQuCgog
ICAgIOKAmHTigJkKICAgICAgICAgIElmIHRoZSByZXN0cmljdGVkIGRlbGV0aW9uIGZsYWcgb3Ig
c3RpY2t5IGJpdCwgYW5kIHRoZQogICAgICAgICAgb3RoZXItZXhlY3V0YWJsZSBiaXQsIGFyZSBi
b3RoIHNldC4gIFRoZSByZXN0cmljdGVkIGRlbGV0aW9uCiAgICAgICAgICBmbGFnIGlzIGFub3Ro
ZXIgbmFtZSBmb3IgdGhlIHN0aWNreSBiaXQuICAqTm90ZSBNb2RlCiAgICAgICAgICBTdHJ1Y3R1
cmU6Oi4KCiAgICAg4oCYVOKAmQogICAgICAgICAgSWYgdGhlIHJlc3RyaWN0ZWQgZGVsZXRpb24g
ZmxhZyBvciBzdGlja3kgYml0IGlzIHNldCBidXQgdGhlCiAgICAgICAgICBvdGhlci1leGVjdXRh
YmxlIGJpdCBpcyBub3Qgc2V0LgoKICAgICDigJh44oCZCiAgICAgICAgICBJZiB0aGUgZXhlY3V0
YWJsZSBiaXQgaXMgc2V0IGFuZCBub25lIG9mIHRoZSBhYm92ZSBhcHBseS4KCiAgICAg4oCYLeKA
mQogICAgICAgICAgT3RoZXJ3aXNlLgoKU28gYXBwYXJlbnRseSB0byBiZSBjb3JyZWN0IHRoaXMg
c2hvdWxkIGJlOgoKCSRsaW5lICF+IC9cYltiY0NkRGxNbnBQc1w/LV1bcnd4c1N0VC1dezksOX1c
Yi8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
