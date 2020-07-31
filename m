Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA26AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 11:14:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB9A2245C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 11:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K/8KlAFL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB9A2245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 38718203F9;
	Fri, 31 Jul 2020 11:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZ4ZhSUO454r; Fri, 31 Jul 2020 11:14:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A3C482046F;
	Fri, 31 Jul 2020 11:14:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 976E1C0050;
	Fri, 31 Jul 2020 11:14:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 176BFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA75C2046F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDsraKbEV0T6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by silver.osuosl.org (Postfix) with ESMTPS id D96CC203F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:14:29 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06VB758g138077;
 Fri, 31 Jul 2020 11:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=RuuosTbYTCr8I08cs/W2a+vgUYd33wv3e8KZbejxVWM=;
 b=K/8KlAFLEUGW81gpFqx4MCbbAEs0r2yk0oc7hMGtcPskWye9ivK9Et+Kl3sVCVoOCwKH
 VzZBhpCak2oMkK2xOBlDfct7jALEHbBdaPCvnyon9+gLGKn4IoxIsq9UoRMAfYFE+xk2
 25JuLV52B4QK1U2LaqU7ae8pC8eOUcEbLYSXtkSEzd3H9e8w4MToeTeDfZPxNp6yxRIv
 uWjuhjL2bnkfnouFdh0rei/OhY1TxqvSd/n6PdnX8Qmuj1yQEDAucDC8sHCl/GwTZfeJ
 U3njJRO1BpNZ1Rma8Dh7ZAR9Wt/T/8/fAZsOAQOm6nqCDl0HnIa0M+aDo6GjChcI5/dm ZA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 32hu1jrhve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Jul 2020 11:14:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06VB8rN8135178;
 Fri, 31 Jul 2020 11:14:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 32hu5yrj6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Jul 2020 11:14:20 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06VBEJNF163083;
 Fri, 31 Jul 2020 11:14:19 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 32hu5yrj69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 11:14:19 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06VBEEbe008514;
 Fri, 31 Jul 2020 11:14:14 GMT
Received: from dhcp-10-175-172-80.vpn.oracle.com (/10.175.172.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 31 Jul 2020 04:14:14 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: =?utf-8?Q?H=C3=A5kon_Bugge?= <haakon.bugge@oracle.com>
In-Reply-To: <20200731095943.GI5493@kadam>
Date: Fri, 31 Jul 2020 13:14:09 +0200
Message-Id: <81B40AF5-EBCA-4628-8CF6-687C12134552@oracle.com>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731095943.GI5493@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=3 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007310084
Cc: rds-devel@oss.oracle.com, Leon Romanovsky <leon@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, OFED mailing list <linux-rdma@vger.kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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

Cgo+IE9uIDMxIEp1bCAyMDIwLCBhdCAxMTo1OSwgRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBvcmFjbGUuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIEp1bCAzMSwgMjAyMCBhdCAwNzo1Mzow
MUFNICswMzAwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6Cj4+IE9uIFRodSwgSnVsIDMwLCAyMDIw
IGF0IDAzOjIwOjI2UE0gLTA0MDAsIFBlaWxpbiBZZSB3cm90ZToKPj4+IHJkc19ub3RpZnlfcXVl
dWVfZ2V0KCkgaXMgcG90ZW50aWFsbHkgY29weWluZyB1bmluaXRpYWxpemVkIGtlcm5lbCBzdGFj
awo+Pj4gbWVtb3J5IHRvIHVzZXJzcGFjZSBzaW5jZSB0aGUgY29tcGlsZXIgbWF5IGxlYXZlIGEg
NC1ieXRlIGhvbGUgYXQgdGhlIGVuZAo+Pj4gb2YgYGNtc2dgLgo+Pj4gCj4+PiBJbiAyMDE2IHdl
IHRyaWVkIHRvIGZpeCB0aGlzIGlzc3VlIGJ5IGRvaW5nIGA9IHsgMCB9O2Agb24gYGNtc2dgLCB3
aGljaAo+Pj4gdW5mb3J0dW5hdGVseSBkb2VzIG5vdCBhbHdheXMgaW5pdGlhbGl6ZSB0aGF0IDQt
Ynl0ZSBob2xlLiBGaXggaXQgYnkgdXNpbmcKPj4+IG1lbXNldCgpIGluc3RlYWQuCj4+IAo+PiBP
ZiBjb3Vyc2UsIHRoaXMgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAieyAwIH0iIGFuZCAie30i
IGluaXRpYWxpemF0aW9ucy4KPj4gCj4gCj4gTm8sIHRoZXJlIGlzIG5vIGRpZmZlcmVuY2UuICBF
dmVuIHN0cnVjdCBhc3NpZ25tZW50cyBsaWtlOgo+IAo+IAlmb28gPSAqYmFyOwo+IAo+IGNhbiBs
ZWF2ZSBzdHJ1Y3QgaG9sZXMgdW5pbml0aWFsaXplZC4gIERlcGVuZGluZyBvbiB0aGUgY29tcGls
ZXIgdGhlCj4gYXNzaWdubWVudCBjYW4gYmUgaW1wbGVtZW50ZWQgYXMgYSBtZW1zZXQoKSBvciBh
cyBhIHNlcmllcyBvZiBzdHJ1Y3QKPiBtZW1iZXIgYXNzaWdubWVudHMuCgpXaGF0IGFib3V0OgoK
c3RydWN0IHJkc19yZG1hX25vdGlmeSB7CglfX3U2NCAgICAgICAgICAgICAgICAgICAgICB1c2Vy
X3Rva2VuOwoJX19zMzIgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzOwp9IF9fYXR0cmlidXRl
X18oKHBhY2tlZCkpOwoKClRoeHMsIEjDpWtvbgoKCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVy
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
