Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C18C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 19:53:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D1F60EFF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 19:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D1F60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78C583B3D;
	Thu, 29 Jul 2021 19:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJe2Ti42NMXA; Thu, 29 Jul 2021 19:53:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D146F83B3A;
	Thu, 29 Jul 2021 19:53:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4AC5C0010;
	Thu, 29 Jul 2021 19:53:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16640C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBB5D83B3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 19:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v58XjDyWKiKy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 19:53:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by smtp1.osuosl.org (Postfix) with ESMTP id 708BA83B3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 19:53:22 +0000 (UTC)
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 994FFCED1E;
 Thu, 29 Jul 2021 21:53:19 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v3 2/2] Bluetooth: fix inconsistent lock state in
 rfcomm_connect_ind
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210721093832.78081-3-desmondcheongzx@gmail.com>
Date: Thu, 29 Jul 2021 21:53:19 +0200
Message-Id: <06E57598-5723-459D-9CE3-4DD8D3145D86@holtmann.org>
References: <20210721093832.78081-1-desmondcheongzx@gmail.com>
 <20210721093832.78081-3-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Stefan Schmidt <stefan@datenfreihafen.org>
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

SGkgRGVzbW9uZCwKCj4gQ29tbWl0IGZhZDAwM2I2YzhlM2QgKCJCbHVldG9vdGg6IEZpeCBpbmNv
bnNpc3RlbnQgbG9jayBzdGF0ZSB3aXRoCj4gUkZDT01NIikgZml4ZWQgYSBsb2NrZGVwIHdhcm5p
bmcgZHVlIHRvIHNrLT5za19sb2NrLnNsb2NrIGJlaW5nCj4gYWNxdWlyZWQgd2l0aG91dCBkaXNh
Ymxpbmcgc29mdGlycSB3aGlsZSB0aGUgbG9jayBpcyBhbHNvIHVzZWQgaW4KPiBzb2Z0aXJxIGNv
bnRleHQuIFRoaXMgd2FzIGRvbmUgYnkgZGlzYWJsaW5nIGludGVycnVwdHMgYmVmb3JlIGNhbGxp
bmcKPiBiaF9sb2NrX3NvY2sgaW4gcmZjb21tX3NrX3N0YXRlX2NoYW5nZS4KPiAKPiBMYXRlciwg
dGhpcyB3YXMgY2hhbmdlZCBpbiBjb21taXQgZTZkYTBlZGMyNGVlICgiQmx1ZXRvb3RoOiBBY3F1
aXJlCj4gc2tfbG9jay5zbG9jayB3aXRob3V0IGRpc2FibGluZyBpbnRlcnJ1cHRzIikgdG8gZGlz
YWJsZSBzb2Z0aXJxcwo+IG9ubHkuCj4gCj4gSG93ZXZlciwgdGhlcmUgaXMgYW5vdGhlciBpbnN0
YW5jZSBvZiBzay0+c2tfbG9jay5zbG9jayBiZWluZyBhY3F1aXJlZAo+IHdpdGhvdXQgZGlzYWJs
aW5nIHNvZnRpcnEgaW4gcmZjb21tX2Nvbm5lY3RfaW5kLiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMK
PiBieSBkaXNhYmxpbmcgbG9jYWwgYmggYmVmb3JlIHRoZSBjYWxsIHRvIGJoX2xvY2tfc29jay4K
CmJhY2sgaW4gdGhlIGRheXMsIHRoZSBwYWNrZXQgcHJvY2Vzc2luZyB3YXMgZG9uZSBpbiBhIHRh
c2tsZXQsIGJ1dCB0aGVzZSBkYXlzIGl0IGlzIGRvbmUgaW4gYSB3b3JrcXVldWUuIFNvIHNob3Vs
ZG7igJl0IHRoaXMgYmUganVzdCBjb252ZXJ0ZWQgaW50byBhIGxvY2tfc29jaygpLiBBbSBJIG1p
c3Npbmcgc29tZXRoaW5nPwoKUmVnYXJkcwoKTWFyY2VsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
