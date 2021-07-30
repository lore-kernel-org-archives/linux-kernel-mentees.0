Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDFCC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 13:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF1860EFF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 13:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFF1860EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAA740529;
	Fri, 30 Jul 2021 13:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7EdEc1HGC_Mx; Fri, 30 Jul 2021 13:40:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C1A97400E5;
	Fri, 30 Jul 2021 13:40:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A88CFC001A;
	Fri, 30 Jul 2021 13:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54280C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 13:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 374074058A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 13:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpaU8XWnAUD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 13:40:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
 by smtp4.osuosl.org (Postfix) with ESMTP id B47AA402DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 13:40:22 +0000 (UTC)
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 754BFCED30;
 Fri, 30 Jul 2021 15:40:20 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v3 2/2] Bluetooth: fix inconsistent lock state in
 rfcomm_connect_ind
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <40f38642-faa9-8c63-4306-6477e272cfbe@gmail.com>
Date: Fri, 30 Jul 2021 15:40:19 +0200
Message-Id: <B35BD760-E00E-43ED-85A1-775197FB3ED1@holtmann.org>
References: <20210721093832.78081-1-desmondcheongzx@gmail.com>
 <20210721093832.78081-3-desmondcheongzx@gmail.com>
 <06E57598-5723-459D-9CE3-4DD8D3145D86@holtmann.org>
 <40f38642-faa9-8c63-4306-6477e272cfbe@gmail.com>
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

SGkgRGVzbW9uZCwKCj4+PiBDb21taXQgZmFkMDAzYjZjOGUzZCAoIkJsdWV0b290aDogRml4IGlu
Y29uc2lzdGVudCBsb2NrIHN0YXRlIHdpdGgKPj4+IFJGQ09NTSIpIGZpeGVkIGEgbG9ja2RlcCB3
YXJuaW5nIGR1ZSB0byBzay0+c2tfbG9jay5zbG9jayBiZWluZwo+Pj4gYWNxdWlyZWQgd2l0aG91
dCBkaXNhYmxpbmcgc29mdGlycSB3aGlsZSB0aGUgbG9jayBpcyBhbHNvIHVzZWQgaW4KPj4+IHNv
ZnRpcnEgY29udGV4dC4gVGhpcyB3YXMgZG9uZSBieSBkaXNhYmxpbmcgaW50ZXJydXB0cyBiZWZv
cmUgY2FsbGluZwo+Pj4gYmhfbG9ja19zb2NrIGluIHJmY29tbV9za19zdGF0ZV9jaGFuZ2UuCj4+
PiAKPj4+IExhdGVyLCB0aGlzIHdhcyBjaGFuZ2VkIGluIGNvbW1pdCBlNmRhMGVkYzI0ZWUgKCJC
bHVldG9vdGg6IEFjcXVpcmUKPj4+IHNrX2xvY2suc2xvY2sgd2l0aG91dCBkaXNhYmxpbmcgaW50
ZXJydXB0cyIpIHRvIGRpc2FibGUgc29mdGlycXMKPj4+IG9ubHkuCj4+PiAKPj4+IEhvd2V2ZXIs
IHRoZXJlIGlzIGFub3RoZXIgaW5zdGFuY2Ugb2Ygc2stPnNrX2xvY2suc2xvY2sgYmVpbmcgYWNx
dWlyZWQKPj4+IHdpdGhvdXQgZGlzYWJsaW5nIHNvZnRpcnEgaW4gcmZjb21tX2Nvbm5lY3RfaW5k
LiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMKPj4+IGJ5IGRpc2FibGluZyBsb2NhbCBiaCBiZWZvcmUg
dGhlIGNhbGwgdG8gYmhfbG9ja19zb2NrLgo+PiBiYWNrIGluIHRoZSBkYXlzLCB0aGUgcGFja2V0
IHByb2Nlc3Npbmcgd2FzIGRvbmUgaW4gYSB0YXNrbGV0LCBidXQgdGhlc2UgZGF5cyBpdCBpcyBk
b25lIGluIGEgd29ya3F1ZXVlLiBTbyBzaG91bGRu4oCZdCB0aGlzIGJlIGp1c3QgY29udmVydGVk
IGludG8gYSBsb2NrX3NvY2soKS4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiAKPiBUaGFua3Mg
Zm9yIHRoZSBpbmZvLiBJIHRoaW5rIHlvdSdyZSByaWdodCwgSSBqdXN0IGRpZG4ndCB1bmRlcnN0
YW5kIHZlcnkgbXVjaCB3aGVuIEkgd3JvdGUgdGhpcyBwYXRjaC4KPiAKPiBJZiBJJ20gdW5kZXJz
dGFuZGluZyBjb3JyZWN0bHksIGl0IHNlZW1zIHRoYXQgYm90aCB0aGUgYmhfbG9ja19zb2NrIGlu
IHJmY29tbV9jb25uZWN0X2luZCwgYW5kIHNwaW5fbG9ja19iaCBpbiByZmNvbW1fc2tfc3RhdGVf
Y2hhbmdlIG5lZWQgdG8gYmUgY2hhbmdlZCB0byBsb2NrX3NvY2ssIG90aGVyd2lzZSB0aGV5IGRv
bid0IHByb3ZpZGUgYW55IHN5bmNocm9uaXphdGlvbiB3aXRoIG90aGVyIGZ1bmN0aW9ucyBpbiBS
RkNPTU0gdGhhdCB1c2UgbG9ja19zb2NrLgo+IAo+IElmIHRoYXQgc291bmRzIGNvcnJlY3QgSSBj
YW4gcHJlcGFyZSB0aGUgcGF0Y2ggZm9yIHRoYXQuCgpwbGVhc2UgZG8gc28gYW5kIHJlLXJ1biB0
aGUgdGVzdHMuIFRoYW5rcy4KClJlZ2FyZHMKCk1hcmNlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
