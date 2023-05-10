Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78688C77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 20:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1748A84481;
	Wed, 10 May 2023 20:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1748A84481
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jWrc2Fp4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBo4ehkhQPB4; Wed, 10 May 2023 20:48:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 143EC8447C;
	Wed, 10 May 2023 20:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143EC8447C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E30D3C0036;
	Wed, 10 May 2023 20:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40C87C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A5861148
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 20:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A5861148
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=jWrc2Fp4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBpOaATxZNdZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 20:48:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49FDC6FF3A
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49FDC6FF3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 20:48:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9186F63F0E;
 Wed, 10 May 2023 20:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B46C433D2;
 Wed, 10 May 2023 20:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683751680;
 bh=p1v9BgVQxNA6CFzcqYCk9q5zJL82xRDoaqm5OkM6CLg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jWrc2Fp4/sCVBp6UHKhYlkrY8SgsyIV1wgvS1fT/r2/D0jxYgQ0LsGjy8CTO+dRSV
 MeUtgW5MbckP8PH4JKRXRc2HjkiksoEE+2fvebpIt2/1WRl8MWeoLKYXwK2XbGJ8eq
 h3Vd9/7EDn8otCnP42jgnCokGb7J0bGy4j4y7UzVVQliiTs67fxCcRGNhGh/BNxwuv
 jj7lz8nAhxCjQ7EwG34CFIavsuOrEysWMXjda8d/QAscgTcZ7z6olL/VpTZgyK8CNG
 oMqpOAQC2uHVa5owxMaThE5Yj2W2Ph8LeLMN4Ksy4njspZ996Tb4XTOdzB6x2YbGQ+
 1jzhTYmToHSdA==
Date: Wed, 10 May 2023 15:47:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
Message-ID: <ZFwC/seTfSoaLn0v@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdYzYp6=mYSoUHN3TEXVSMbRt1HpRm0X_4RMez09V0XzQewaw@mail.gmail.com>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

T24gVHVlLCBNYXkgMDksIDIwMjMgYXQgMDg6MTE6MjlQTSAtMDQwMCwgUGV0ZXIgR2VpcyB3cm90
ZToKPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDU6MTnigK9QTSBCam9ybiBIZWxnYWFzIDxoZWxn
YWFzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMDksIDIwMjMgYXQgMDU6Mzk6
MTJQTSArMDIwMCwgVmluY2Vuem8gUGFsYXp6byB3cm90ZToKPiA+ID4gQWRkIGEgY29uZmlndXJh
YmxlIGRlbGF5IHRvIHRoZSBSb2NrY2hpcCBQQ0llIGRyaXZlciB0byBhZGRyZXNzCj4gPiA+IGNy
YXNoZXMgdGhhdCBvY2N1ciBvbiBzb21lIG9sZCBkZXZpY2VzLCBzdWNoIGFzIHRoZSBQaW5lNjQg
Um9ja1BybzY0Lgo+ID4gPgo+ID4gPiBUaGlzIGlzc3VlIGlzIGFmZmVjdGluZyB0aGUgQVJNIGNv
bW11bml0eSwgYnV0IHRoZXJlIGlzIG5vCj4gPiA+IHVwc3RyZWFtIHNvbHV0aW9uIGZvciBpdCB5
ZXQuCj4gPgo+ID4gSXQgc291bmRzIGxpa2UgdGhpcyBoYXBwZW5zIHdpdGggc2V2ZXJhbCBlbmRw
b2ludHMsIHJpZ2h0PyAgQW5kIEkKPiA+IGFzc3VtZSB0aGUgZW5kcG9pbnRzIHdvcmsgZmluZSBp
biBvdGhlciBub24tUm9ja2NoaXAgc3lzdGVtcz8gIElmCj4gPiB0aGF0J3MgdGhlIGNhc2UsIG15
IGd1ZXNzIGlzIHRoZSBwcm9ibGVtIGlzIHdpdGggdGhlIFJvY2tjaGlwIGhvc3QKPiA+IGNvbnRy
b2xsZXIgYW5kIGhvdyBpdCdzIGluaXRpYWxpemVkLCBub3Qgd2l0aCB0aGUgZW5kcG9pbnRzLgo+
ID4gLi4uCgo+IFRoZSBtYWluIGlzc3VlIHdpdGggdGhlIHJrMzM5OSBpcyB0aGUgUENJZSBjb250
cm9sbGVyIGlzIGJ1Z2d5IGFuZAo+IHRyaWdnZXJzIGEgU29DIHBhbmljIHdoZW4gY2VydGFpbiBl
cnJvciBjb25kaXRpb25zIG9jY3VyIHRoYXQgc2hvdWxkCj4gYmUgaGFuZGxlZCBncmFjZWZ1bGx5
LiBPbmUgb2YgdGhvc2UgY29uZGl0aW9ucyBpcyB3aGVuIGFuIGVuZHBvaW50Cj4gcmVxdWVzdHMg
YW4gYWNjZXNzIHRvIHdhaXQgYW5kIHJldHJ5IGxhdGVyLgoKSSBhc3N1bWUgdGhpcyByZWZlcnMg
dG8gYSBDb21wbGV0aW9uIHdpdGggUmVxdWVzdCBSZXRyeSBTdGF0dXMgKFJSUyk/Cgo+IE1hbnkg
eWVhcnMgYWdvIHdlIHJhbiB0aGF0IGlzc3VlIHRvIGdyb3VuZCBhbmQgd2l0aCBSb2JpbiBNdXJw
aHkncwo+IGhlbHAgd2UgZm91bmQgdGhhdCB3aGlsZSBpdCdzIHBvc3NpYmxlIHRvIGdyYWNlZnVs
bHkgaGFuZGxlIHRoYXQKPiBjb25kaXRpb24gaXQgcmVxdWlyZWQgaGlqYWNraW5nIHRoZSBlbnRp
cmUgYXJtNjQgZXJyb3IgaGFuZGxpbmcKPiByb3V0aW5lLiBOb3QgZXhhY3RseSBzY2FsYWJsZSBm
b3IganVzdCBvbmUgU29DLgoKRG8geW91IGhhdmUgYSBwb2ludGVyIHRvIHRoYXQgZGlzY3Vzc2lv
bj8gIFRoZSBVUkwgbWlnaHQgc2F2ZQpyZXBlYXRpbmcgdGhlIHdob2xlIGV4ZXJjaXNlIGFuZCBj
b3VsZCBiZSB1c2VmdWwgZm9yIHRoZSBjb21taXQgbG9nCndoZW4gd2UgdHJ5IHRvIHJlc29sdmUg
dGhpcy4KCj4gVGhlIGNvbmZpZ3VyYWJsZSB3YWl0cyBhbGxvdyB1cyB0byBwcm9ncmFtIHJlYXNv
bmFibGUgdGltZXMgZm9yCj4gOTAlIG9mIHRoZSBlbmRwb2ludHMgdGhhdCBjb21lIHVwIGluIHRo
ZSBub3JtYWwgYW1vdW50IG9mIHRpbWUsIHdoaWxlCj4gYmVpbmcgYWJsZSB0byBhZGp1c3QgaXQg
Zm9yIHRoZSBvdGhlciAxMCUgdGhhdCBkbyBub3QuIFNvbWUgcmVxdWlyZQo+IG11bHRpcGxlIHNl
Y29uZHMgYmVmb3JlIHRoZXkgcmV0dXJuIHdpdGhvdXQgZXJyb3IuIFBhcnQgb2YgdGhlIHJlYXNv
bgo+IHdlIGRvbid0IHdhbnQgdG8gaGFyZGNvZGUgdGhlIHdhaXQgdGltZSBpcyBiZWNhdXNlIHRo
ZSBwcm9iZSBpc24ndAo+IGhhbmRsZWQgYXN5bmNocm9ub3VzbHksIHNvIHRoZSBrZXJuZWwgYXBw
ZWFycyB0byBoYW5nIHdoaWxlIHdhaXRpbmcKPiBmb3IgdGhlIHRpbWVvdXQuCgpJcyB0aGVyZSBz
b21lIHdheSBmb3IgdXNlcnMgdG8gZmlndXJlIG91dCB0aGF0IHRoZXkgd291bGQgbmVlZCB0aGlz
CnByb3BlcnR5PyAgT3IgaXMgaXQganVzdCAiaWYgeW91ciBrZXJuZWwgcGFuaWNzIG9uIGJvb3Qs
IHRyeQphZGRpbmcgb3IgaW5jcmVhc2luZyAiYnVzLXNjYW4tZGVsYXktbXMiIGluIHlvdXIgRFQ/
CgpCam9ybgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
