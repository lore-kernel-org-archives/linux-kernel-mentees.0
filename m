Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD131EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Jul 2023 15:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F33660B26;
	Sun,  9 Jul 2023 15:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F33660B26
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ohY/WFfA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nhrzQeVQlnx; Sun,  9 Jul 2023 15:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1146560A65;
	Sun,  9 Jul 2023 15:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1146560A65
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6F5CC0072;
	Sun,  9 Jul 2023 15:21:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA1C7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B050D409FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B050D409FE
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ohY/WFfA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzrbLSklpChZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2406E409E7
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2406E409E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:21:28 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-635f1c7412cso24154556d6.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Jul 2023 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688916087; x=1691508087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXze9nUKh3L/uVH6x+jXJ18GdHQRruzVjV/78O4GZMY=;
 b=ohY/WFfA/sRGBA4R0KgzTo2+nxeftQxpFjbVxRLgXp18495Iww7oORay5zcJDyJUkn
 yU+c5Tyh8yOSCRHTmO89Go1wwVrV4rmVhWosQpjkXXxAbivjK0it2vLuOTw/Xg4MmHgu
 j1s1XS7HlzfJp1mEYexrp9VE9zsWA6tj01QJkiujCFvUrGoZ4UTFDts76qt6OQcRfXA4
 h6QabV0O1bjSGNeEhh1yMdtDVRXv+gXZYdo9e1+S59jeXundJdCReVswuhn1lRhzewoq
 GAp2ldJKB9qZQHqgxC5/mGMCTzU2q/xIhPPlxPkLGhBPeHIqchiI7eaaGwDgqPa8q6b9
 Iv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688916087; x=1691508087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXze9nUKh3L/uVH6x+jXJ18GdHQRruzVjV/78O4GZMY=;
 b=hygjTXGpQsxLVNdzYfcF2Z9cSvz/ZdWL0BSnRX6qthAASGnG4qpuAEIkMoZRPJVSwm
 GsTz+RZyb4zdTr49IBGs4sP+8ZNF2r6k3v9n+YZ1dCtnOQyh5oqeK01mdmTlqbcrYCu+
 p16gze5j2szdg0xDiGXWIw8PX2o64qHqcDRvBRqKxV1cHrl4/tPRkO4wrYO7dugsE3dx
 pUoZgdtlUbhEBBltiip1zy7qNFPj6KMm2zEt69WsAt0Bya5Ykxz1IrER9VO32K6txq13
 TtBfYuS+ChsxrgRiBnIF4qGwmqM10PM3xQm0YFjQ6vWQYTQ2aiYQCVkHOvB3iasquRfp
 etZA==
X-Gm-Message-State: ABy/qLb/3r/MF0k0keWK9LpX5c8NVosZzjWF//jMy0yHnzBPvRDCBMP1
 AyXaONbosS4BVJacfpnG/1JMBVJg/kjL7nWr6FY=
X-Google-Smtp-Source: APBJJlEdq7rukVPmHWotJgyxWCHBi8Gz8rPkQHIFxIih/GG2D1LXUCqjvJoErcr42R7byp5T1pln5k3+OPMf3IluIDc=
X-Received: by 2002:a0c:f393:0:b0:636:14d4:4481 with SMTP id
 i19-20020a0cf393000000b0063614d44481mr9636969qvk.1.1688916086836; Sun, 09 Jul
 2023 08:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com> <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com> <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
In-Reply-To: <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sun, 9 Jul 2023 21:21:15 +0600
Message-ID: <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel@iogearbox.net, linux-kernel-mentees@lists.linuxfoundation.org,
 andrii@kernel.org, ast@kernel.org, Stanislav Fomichev <sdf@google.com>,
 bpf@vger.kernel.org, martin.lau@linux.dev
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

SGksCgpPbiBTdW4sIEp1bCA5LCAyMDIzIGF0IDg6MzjigK9QTSBBbmggVHVhbiBQaGFuIDx0dWFu
YW5obGZjQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBTdGFuaXNsYXYsCj4KPiBJIGhhdmUgdXBk
YXRlZCB0aGUgRG9jdW1lbnRhdGlvbiBhY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0aW9uLiBQbGVh
c2UKPiBzZWUgaXQgaW4gdGhlIGJlbG93IHBhdGNoLiBUaGFua3MhCj4KPiBPbiA3LzcvMjMgMjM6
NTcsIFN0YW5pc2xhdiBGb21pY2hldiB3cm90ZToKPiA+IE9uIDA3LzA3LCBBbmggVHVhbiBQaGFu
IHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiBPbiA3LzcvMjMgMDE6MTYsIFN0YW5pc2xhdiBGb21pY2hl
diB3cm90ZToKPiA+Pj4gT24gMDcvMDYsIEFuaCBUdWFuIFBoYW4gd3JvdGU6Cj4gPj4+PiBVcGRh
dGUgdGhlIERvY3VtZW50YXRpb24gdG8gbWVudGlvbiB0aGF0IHNvbWUgc2FtcGxlcyByZXF1aXJl
IHBhaG9sZQo+ID4+Pj4gdjEuMTYgYW5kIGtlcm5lbCBidWlsdCB3aXRoIENPTkZJR19ERUJVR19J
TkZPX0JURj15Cj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQW5oIFR1YW4gUGhhbiA8dHVh
bmFuaGxmY0BnbWFpbC5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+ICBzYW1wbGVzL2JwZi9SRUFETUUu
cnN0IHwgNyArKysrKysrCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+
ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9zYW1wbGVzL2JwZi9SRUFETUUucnN0IGIvc2FtcGxl
cy9icGYvUkVBRE1FLnJzdAo+ID4+Pj4gaW5kZXggNTdmOTNlZGQxOTU3Li42MzE1OTJiODNkNjAg
MTAwNjQ0Cj4gPj4+PiAtLS0gYS9zYW1wbGVzL2JwZi9SRUFETUUucnN0Cj4gPj4+PiArKysgYi9z
YW1wbGVzL2JwZi9SRUFETUUucnN0Cj4gPj4+PiBAQCAtMTQsNiArMTQsOSBAQCBDb21waWxpbmcg
cmVxdWlyZXMgaGF2aW5nIGluc3RhbGxlZDoKPiA+Pj4+ICBOb3RlIHRoYXQgTExWTSdzIHRvb2wg
J2xsYycgbXVzdCBzdXBwb3J0IHRhcmdldCAnYnBmJywgbGlzdCB2ZXJzaW9uCj4gPj4+PiAgYW5k
IHN1cHBvcnRlZCB0YXJnZXRzIHdpdGggY29tbWFuZDogYGBsbGMgLS12ZXJzaW9uYGAKPiA+Pj4+
Cj4gPj4+PiArU29tZSBzYW1wbGVzIHJlcXVpcmUgcGFob2xlIHZlcnNpb24gMS4xNiBhcyBhIGRl
cGVuZGVuY3kuIFNlZQo+ID4+Pj4gK2h0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2JwZi9icGZfZGV2
ZWxfUUEuaHRtbCBmb3IgcmVmZXJlbmNlLgo+ID4+Pj4gKwo+ID4+Pgo+ID4+PiBBbnkgcmVhc29u
IG5vIHRvIGFkZCBwYWhvbGUgMS4xNiB0byB0aGlzIHNlY3Rpb24gYWJvdmU/Cj4gPj4+PiBDb21w
aWxpbmcgcmVxdWlyZXMgaGF2aW5nIGluc3RhbGxlZDoKPiA+Pj4gICogY2xhbmcgPj0gdmVyc2lv
biAzLjQuMAo+ID4+PiAgKiBsbHZtID49IHZlcnNpb24gMy43LjEKPiA+Pj4gICogcGFob2xlID49
IHZlcnNpb24gMS4xNgo+ID4+Pgo+ID4+PiBBbHRob3VnaCBjbGFuZyAzLjQgcHJvYmFibHkgd29u
J3QgZ2V0IHlvdSBhbnl3aGVyZSB0aGVzZSBkYXlzLiBUaGUKPiA+Pj4gd2hvbGUgUkVBRE1FIHNl
ZW1zIGEgYml0IG91dGRhdGVkIDotKQo+ID4+Pgo+ID4+Cj4gPj4gUHV0IHBhaG9sZSByZXF1aXJl
bWVudCBhcyB5b3VyIGlkZWEgaXMgYmV0dGVyLCB0aGFua3MgZm9yIHN1Z2dlc3Rpb24uCj4gPj4g
V2lsbCB1cGRhdGUgaXQgYW5kIGNsYW5nIHZlcnNpb24gYXMgd2VsbC4gRm9yIGNsYW5nIHZlcnNp
b24sIEkgdGhpbmsgSQo+ID4+IGNhbiB1cGRhdGUgbWluIHZlcnNpb24gYXMgMTEuMC4wIChyZWZl
cmVuY2UgZnJvbQo+ID4+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbmV4dC9wcm9j
ZXNzL2NoYW5nZXMuaHRtbCkuIERvIHlvdSBzZWUKPiA+PiBhbnkgb3RoZXIgcG90ZW50aWFsIG91
dGRhdGVkIHRoaW5ncyBpbiB0aGlzIGRvY3VtZW50PyBJIGZvbGxvdyB0aGUgYWJvdmUKPiA+PiBz
dGVwcyBhbmQgaXQgaGVscCBtZSBjb21waWxlIHRoZSBzYW1wbGUgY29kZSBzdWNjZXNzZnVsbHku
Cj4gPgo+ID4gTWF5YmUgd2UgY2FuIHJlZmVyZW5jZSB0aGF0IGRvYyBpbnN0ZWFkIGhlcmU/IE90
aGVyd2lzZSB0aGF0IGNvcHktcGFzdGVkCj4gPiAxMS4wLjAgd2lsbCBhbHNvIGdldCBvbGQuIEp1
c3QgbWVudGlvbiBoZXJlIHRoYXQgd2UgbmVlZAo+ID4gY2xhbmcvbGx2bS9wYWhvbGUgdG8gY29t
cGlsZSB0aGUgc2FtcGxlcyBhbmQgZm9yIHNwZWNpZmljIHZlcnNpb25zCj4gPiBwdXQgYSBsaW5r
IHRvIHByb2Nlc3MvY2hhbmdlcy5yc3QKPiA+Cj4gPj4+PiAgQ2xlYW4gYW5kIGNvbmZpZ3VyYXRp
b24KPiA+Pj4+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+Pj4KPiA+Pj4+IEBAIC0yOCw2
ICszMSwxMCBAQCBDb25maWd1cmUga2VybmVsLCBkZWZjb25maWcgZm9yIGluc3RhbmNlOjoKPiA+
Pj4+Cj4gPj4+PiAgIG1ha2UgZGVmY29uZmlnCj4gPj4+Pgo+ID4+Pj4gK1NvbWUgc2FtcGxlcyBy
ZXF1aXJlIHN1cHBvcnQgZm9yIEJQRiBUeXBlIEZvcm1hdCAoQlRGKS4gVG8gZW5hYmxlIGl0LAo+
ID4+Pj4gb3BlbiB0aGUKPiA+Pj4+ICtnZW5lcmF0ZWQgY29uZmlnIGZpbGUsIG9yIHVzZSBtZW51
Y29uZmlnIChieSAibWFrZSBtZW51Y29uZmlnIikgdG8KPiA+Pj4+IGVuYWJsZSB0aGUKPiA+Pj4+
ICtmb2xsb3dpbmcgY29uZmlnczogQ09ORklHX0JQRl9TWVNDQUxMIGFuZCBDT05GSUdfREVCVUdf
SU5GT19CVEYuCj4gPj4+PiArCj4gPj4+Cj4gPj4+IFRoaXMgaXMgdXN1YWxseSBlbmFibGVkIGJ5
IGRlZmF1bHQsIHNvIHdoeSBzcGVjaWFsIGNhc2UgaXQgaGVyZT8KPiA+Pj4gTWF5YmUsIGlmIHlv
dSB3YW50IHNvbWUgaGludHMgYWJvdXQgdGhlIGNvbmZpZywgd2Ugc2hvdWxkIGFkZAo+ID4+PiBh
IHJlZmVyZW5jZSB0byB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmlnID8KPiA+Pj4K
PiA+Pgo+ID4+IFRoZSBjb25maWcgQ09ORklHX0RFQlVHX0lORk9fQlRGIGlzIGRpc2FibGVkIGZv
ciBzb21lIGRpc3Ryb3MgYXQgbGVhc3QKPiA+PiBmb3IgbWluZS4gSSByYW4gIm1ha2UgZGVmY29u
ZmlnIiBhbmQgaXQncyBub3QgZW5hYmxlZCBieSBkZWZhdWx0IHNvIEkKPiA+PiB0aGluayBpdCB3
b3J0aCB0byBtZW50aW9uIGl0IGhlcmUgdG8gaGVscCBub3ZpY2UgZ2V0IHN0YXJ0ZWQuIEknbGwK
PiA+PiB1cGRhdGUgaXQgdG8gcmVmZXJlbmNlIHRvIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9jb25maWcgLgo+ID4+Cj4gPj4+PiAgS2VybmVsIGhlYWRlcnMKPiA+Pj4+ICAtLS0tLS0tLS0t
LS0tLQo+ID4+Pj4KPiA+Pj4+IC0tCj4gPj4+PiAyLjM0LjEKPgo+IFNpZ25lZC1vZmYtYnk6IEFu
aCBUdWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21haWwuY29tPgo+IC0tLQo+Cj4gQ2hhbmdlIGZyb20g
dGhlIG9yaWdpbmFsIHBhdGNoOgo+Cj4gLSBNb3ZlIHBhaG9sZSB0byB0aGUgbGlzdCBpbnN0YWxs
ZWQgcmVxdWlyZW1lbnRzCj4gLSBSZW1vdmUgbWluaW1hbCB2ZXJzaW9uIGFuZCBsaW5rIHRoZSBy
ZWxhdGVkIGRvYwo+IC0gQWRkIGEgcmVmZXJlbmNlIG9mIGtlcm5lbCBjb25maWd1cmF0aW9uCj4K
PiAgc2FtcGxlcy9icGYvUkVBRE1FLnJzdCB8IDEwICsrKysrKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9zYW1w
bGVzL2JwZi9SRUFETUUucnN0IGIvc2FtcGxlcy9icGYvUkVBRE1FLnJzdAo+IGluZGV4IDU3Zjkz
ZWRkMTk1Ny4uZTE4NTAwNzUzYmE1IDEwMDY0NAo+IC0tLSBhL3NhbXBsZXMvYnBmL1JFQURNRS5y
c3QKPiArKysgYi9zYW1wbGVzL2JwZi9SRUFETUUucnN0Cj4gQEAgLTgsOSArOCwxMiBAQCBCdWls
ZCBkZXBlbmRlbmNpZXMKPiAgPT09PT09PT09PT09PT09PT09Cj4KPiAgQ29tcGlsaW5nIHJlcXVp
cmVzIGhhdmluZyBpbnN0YWxsZWQ6Cj4gLSAqIGNsYW5nID49IHZlcnNpb24gMy40LjAKPiAtICog
bGx2bSA+PSB2ZXJzaW9uIDMuNy4xCj4gKyAqIGNsYW5nCj4gKyAqIGxsdm0KPiArICogcGFob2xl
Cj4KPiArVGhlIG1pbmltYWwgdmVyc2lvbiBvZiB0aGUgYWJvdmUgc29mdHdhcmUgaXMgcmVmZXJl
bmNlZCBpbgo+ICtodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL25leHQvcHJvY2Vzcy9j
aGFuZ2VzLmh0bWwuCgpJIHRoaW5rIGl0IGlzIGJldHRlciB0byBub3QgdXNlIGRvY3MgZnJvbSBs
aW51eC1uZXh0IGFzIGl0IGtlZXBzIGNoYW5naW5nCnRvbyBmcmVxdWVudGx5LiBIb3cgYWJvdXQg
dXNpbmcgdGhlIGxhdGVzdCBkb2N1bWVudGF0aW9uJ3MgbGluayBpbnN0ZWFkPyA6KQoKaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9jaGFuZ2VzLmh0bWwKCkhv
d2V2ZXIsIHNvbWV0aGluZyB0byB0aGluayBhYm91dCBpczogSWYgZnV0dXJlIHZlcnNpb25zIG9m
IGNsYW5nLCBsbHZtIGV0YwpkbyBub3Qgc3VwcG9ydCBjb21waWxpbmcgb3VyIGNvZGUgYXMgaXQg
aXMgbm93LCBpdCBtYXkgYmVjb21lIG1pc2xlYWRpbmcuCgoKPiAgTm90ZSB0aGF0IExMVk0ncyB0
b29sICdsbGMnIG11c3Qgc3VwcG9ydCB0YXJnZXQgJ2JwZicsIGxpc3QgdmVyc2lvbgo+ICBhbmQg
c3VwcG9ydGVkIHRhcmdldHMgd2l0aCBjb21tYW5kOiBgYGxsYyAtLXZlcnNpb25gYAo+Cj4gQEAg
LTI0LDcgKzI3LDggQEAgYWZ0ZXIgc29tZSBjaGFuZ2VzIChvbiBkZW1hbmQpOjoKPiAgIG1ha2Ug
LUMgc2FtcGxlcy9icGYgY2xlYW4KPiAgIG1ha2UgY2xlYW4KPgo+IC1Db25maWd1cmUga2VybmVs
LCBkZWZjb25maWcgZm9yIGluc3RhbmNlOjoKPiArQ29uZmlndXJlIGtlcm5lbCwgZGVmY29uZmln
IGZvciBpbnN0YW5jZQo+ICsoc2VlICJ0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvY29uZmln
IiBmb3IgYSByZWZlcmVuY2UgY29uZmlnKTo6Cj4KPiAgIG1ha2UgZGVmY29uZmlnCj4KPiAtLQoK
dGhhbmtzLAogIC0tIEtoYWxpZCBNYXN1bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgt
a2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
