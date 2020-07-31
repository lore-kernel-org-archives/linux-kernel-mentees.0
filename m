Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039B4C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:05:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C399620663
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iZX7Ayql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C399620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A36C886B7;
	Fri, 31 Jul 2020 12:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BA5kXteRkyh5; Fri, 31 Jul 2020 12:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63503886F0;
	Fri, 31 Jul 2020 12:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4320DC0050;
	Fri, 31 Jul 2020 12:05:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 934FBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C7CB86982
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3j1ZjFSkgIM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3EBF886978
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:05:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06VC2wKA036678;
 Fri, 31 Jul 2020 12:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=wQSjVYBw/TnpmeaVef5NuD3Sb07fZXefhlktIO+86VE=;
 b=iZX7AyqlTaeG0sax9PxX4B4ZcMa2vT0UZ7l/Y+qmA1wZlGMKLak5Bs9GINU76b0lfvYm
 ey6lmKPyGj3kt6rI2z71n217FQ72/y7ayy7rFtbD7yEjPFW5ph4B+/DwvW4S1WNvK0EJ
 87xTp9jGelyP01Vqr2pJIJww6jcOHz8AU/g/VLB4NRxrrmkHCyMmGvBqXiOJun+04Q6z
 JyQNhQ3VhAIoSRf1E2CbKlUGYo0+/ayHFWK8VIFxcPoqV+v1WMPN8fdwF+K/p3KbpHT1
 k7K+7KOHh8FFAn6Jzq+mfTB8y5hdo9Qzvx/v+HfwZKpsv5Zt8R13N8ZzegxlMOu051qn WA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 32hu1jrqca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Jul 2020 12:05:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06VC2bSk150843;
 Fri, 31 Jul 2020 12:03:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 32hu63wuxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Jul 2020 12:03:13 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06VC3Cr1152622;
 Fri, 31 Jul 2020 12:03:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 32hu63wuv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 12:03:12 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06VC3Anq029674;
 Fri, 31 Jul 2020 12:03:10 GMT
Received: from dhcp-10-175-172-80.vpn.oracle.com (/10.175.172.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 31 Jul 2020 05:03:10 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: =?utf-8?Q?H=C3=A5kon_Bugge?= <haakon.bugge@oracle.com>
In-Reply-To: <20200731115909.GA1649637@kroah.com>
Date: Fri, 31 Jul 2020 14:03:06 +0200
Message-Id: <866B1B5B-0156-4EED-9599-51BEF5661DA9@oracle.com>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731095943.GI5493@kadam>
 <81B40AF5-EBCA-4628-8CF6-687C12134552@oracle.com>
 <20200731115909.GA1649637@kroah.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=3 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007310090
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>,
 OFED mailing list <linux-rdma@vger.kernel.org>, netdev@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Cgo+IE9uIDMxIEp1bCAyMDIwLCBhdCAxMzo1OSwgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gCj4gT24gRnJpLCBKdWwgMzEsIDIwMjAgYXQg
MDE6MTQ6MDlQTSArMDIwMCwgSMOla29uIEJ1Z2dlIHdyb3RlOgo+PiAKPj4gCj4+PiBPbiAzMSBK
dWwgMjAyMCwgYXQgMTE6NTksIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNv
bT4gd3JvdGU6Cj4+PiAKPj4+IE9uIEZyaSwgSnVsIDMxLCAyMDIwIGF0IDA3OjUzOjAxQU0gKzAz
MDAsIExlb24gUm9tYW5vdnNreSB3cm90ZToKPj4+PiBPbiBUaHUsIEp1bCAzMCwgMjAyMCBhdCAw
MzoyMDoyNlBNIC0wNDAwLCBQZWlsaW4gWWUgd3JvdGU6Cj4+Pj4+IHJkc19ub3RpZnlfcXVldWVf
Z2V0KCkgaXMgcG90ZW50aWFsbHkgY29weWluZyB1bmluaXRpYWxpemVkIGtlcm5lbCBzdGFjawo+
Pj4+PiBtZW1vcnkgdG8gdXNlcnNwYWNlIHNpbmNlIHRoZSBjb21waWxlciBtYXkgbGVhdmUgYSA0
LWJ5dGUgaG9sZSBhdCB0aGUgZW5kCj4+Pj4+IG9mIGBjbXNnYC4KPj4+Pj4gCj4+Pj4+IEluIDIw
MTYgd2UgdHJpZWQgdG8gZml4IHRoaXMgaXNzdWUgYnkgZG9pbmcgYD0geyAwIH07YCBvbiBgY21z
Z2AsIHdoaWNoCj4+Pj4+IHVuZm9ydHVuYXRlbHkgZG9lcyBub3QgYWx3YXlzIGluaXRpYWxpemUg
dGhhdCA0LWJ5dGUgaG9sZS4gRml4IGl0IGJ5IHVzaW5nCj4+Pj4+IG1lbXNldCgpIGluc3RlYWQu
Cj4+Pj4gCj4+Pj4gT2YgY291cnNlLCB0aGlzIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gInsg
MCB9IiBhbmQgInt9IiBpbml0aWFsaXphdGlvbnMuCj4+Pj4gCj4+PiAKPj4+IE5vLCB0aGVyZSBp
cyBubyBkaWZmZXJlbmNlLiAgRXZlbiBzdHJ1Y3QgYXNzaWdubWVudHMgbGlrZToKPj4+IAo+Pj4g
CWZvbyA9ICpiYXI7Cj4+PiAKPj4+IGNhbiBsZWF2ZSBzdHJ1Y3QgaG9sZXMgdW5pbml0aWFsaXpl
ZC4gIERlcGVuZGluZyBvbiB0aGUgY29tcGlsZXIgdGhlCj4+PiBhc3NpZ25tZW50IGNhbiBiZSBp
bXBsZW1lbnRlZCBhcyBhIG1lbXNldCgpIG9yIGFzIGEgc2VyaWVzIG9mIHN0cnVjdAo+Pj4gbWVt
YmVyIGFzc2lnbm1lbnRzLgo+PiAKPj4gV2hhdCBhYm91dDoKPj4gCj4+IHN0cnVjdCByZHNfcmRt
YV9ub3RpZnkgewo+PiAJX191NjQgICAgICAgICAgICAgICAgICAgICAgdXNlcl90b2tlbjsKPj4g
CV9fczMyICAgICAgICAgICAgICAgICAgICAgIHN0YXR1czsKPj4gfSBfX2F0dHJpYnV0ZV9fKChw
YWNrZWQpKTsKPiAKPiBXaHkgaXMgdGhpcyBzdGlsbCBhIGRpc2N1c3Npb24gYXQgYWxsPwo+IAo+
IFRyeSBpdCBhbmQgc2VlLCBydW4gcGFob2xlIGFuZCBzZWUgaWYgdGhlcmUgYXJlIGhvbGVzIGlu
IHRoaXMgc3RydWN0dXJlCj4gKG9kZHMgYXJlIG5vKSwgeW91IGRvbid0IG5lZWQgdXMgdG8gc2F5
IHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUuLi4KCkFuIG9sZGVyIHBvc3RpbmcgaGFkIHRoaXM6Cgok
IHBhaG9sZSAtQyAicmRzX3JkbWFfbm90aWZ5IiBuZXQvcmRzL3JlY3YubwpzdHJ1Y3QgcmRzX3Jk
bWFfbm90aWZ5IHsKCV9fdTY0ICAgICAgICAgICAgICAgICAgICAgIHVzZXJfdG9rZW47ICAgICAg
ICAgICAvKiAgICAgMCAgICAgOCAqLwoJX19zMzIgICAgICAgICAgICAgICAgICAgICAgc3RhdHVz
OyAgICAgICAgICAgICAgIC8qICAgICA4ICAgICA0ICovCgoJLyogc2l6ZTogMTYsIGNhY2hlbGlu
ZXM6IDEsIG1lbWJlcnM6IDIgKi8KCS8qIHBhZGRpbmc6IDQgKi8KCS8qIGxhc3QgY2FjaGVsaW5l
OiAxNiBieXRlcyAqLwp9OwoKClRoeHMsIEjDpWtvbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0
CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1l
bnRlZXMK
