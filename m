Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1292CC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Aug 2023 22:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916B9415EB;
	Mon, 14 Aug 2023 22:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 916B9415EB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XC8KnyPg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67NbRmcIgpKO; Mon, 14 Aug 2023 22:54:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 329D340959;
	Mon, 14 Aug 2023 22:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329D340959
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AF52C0071;
	Mon, 14 Aug 2023 22:54:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15D32C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2F0581391
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F0581391
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=XC8KnyPg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnn961FuVzMp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:54:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BC8681210
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 22:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC8681210
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37ELxkOQ031993; Mon, 14 Aug 2023 22:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aqvogJ3Gg6Ldr/fyhM0dIyPC+xh6v86/zGhN0n8wpiI=;
 b=XC8KnyPgz7+Jc2xX0zs7B0+5qOVicX4w/rfXyn/n01o1WaAu/4Z9xJWjZ78dTBOjCCOo
 oO8GZFaMrnNYzI4TN+M8mCNVchQ5bDw+IYc6FB/XvkBJBByVcbPxfY5oGby6kL45WFZM
 N24/kDYvTymeHengEgF7VVVx2c8kbJxcJghWfVUQkX/0Z7tToDB5duiwXms0Ggu4zVha
 TgBlJEPhjy+RiAju3Jt+NlxmG1yvaSahsDV2fM4nyW+76NhCp2KuB7IGl5JwuG505f8C
 vu8N1hZqAzUL6W5sMW79/nsuvM2KDVxZXv8gLqH4thVGyVHDUOZd9qly8DB4VGWefbAD iA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sffxt9tng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 22:31:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37EMV5CZ007350
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Aug 2023 22:31:05 GMT
Received: from [10.48.240.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 14 Aug
 2023 15:31:04 -0700
Message-ID: <bc736eb5-3240-48af-38e1-0728ef43211b@quicinc.com>
Date: Mon, 14 Aug 2023 15:31:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ath5k: fix WARNING opportunity for swap.
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, <jirislaby@kernel.org>,
 <mickflemm@gmail.com>, <mcgrof@kernel.org>, <kvalo@kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230814200234.637583-1-mahmoudmatook.mm@gmail.com>
 <01fc3da3-dc67-8873-dd59-f77a7d067f33@quicinc.com>
In-Reply-To: <01fc3da3-dc67-8873-dd59-f77a7d067f33@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qFxs8487Xz6MPaaFVBu7-5rvpo5ZASbB
X-Proofpoint-GUID: qFxs8487Xz6MPaaFVBu7-5rvpo5ZASbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_18,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=997 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140206
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

T24gOC8xNC8yMDIzIDM6MjggUE0sIEplZmYgSm9obnNvbiB3cm90ZToKPiBPbiA4LzE0LzIwMjMg
MTowMiBQTSwgTWFobW91ZCBNYWF0dXEgd3JvdGU6Cj4+IGNvY2NpbmllbGxlIHJlcG9ydGVkIHRo
ZSBmb2xsb3dpbmc6Cj4+IC4vZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL3BoeS5jOjE1
NzM6MjUtMjY6IFdBUk5JTkcgb3Bwb3J0dW5pdHkgCj4+IGZvciBzd2FwKCkKPiAKPiBTdWdnZXN0
IHlvdSBhZGQgc29tZXRoaW5nIGxpa2U6Cj4gCj4gVGhpcyByZXZlYWxlZCB0aGF0IGF0aDVrX2h3
X2dldF9tZWRpYW5fbm9pc2VfZmxvb3IoKSBoYWQgb3Blbi1jb2RlZCAKPiBzb3J0KCkgZnVuY3Rp
b25hbGl0eS4gU2luY2UgYXRoNWtfaHdfZ2V0X21lZGlhbl9ub2lzZV9mbG9vcigpIG9ubHkgCj4g
ZXhlY3V0ZXMgb25jZSBldmVyeSAxMCBzZWNvbmRzLCBhbnkgZXh0cmEgb3ZlcmhlYWQgZHVlIHRv
IHNvcnQoKSBjYWxsaW5nIAo+IGl0J3MgImNvbXBhcmUiIGFuZCAic3dhcCIgZnVuY3Rpb25zIGNh
biBiZSBpZ25vcmVkLCBzbyByZXBsYWNlIHRoZSAKCjxibHVzaD4gYW5kIG9mIGNvdXJzZSB0aGF0
IHNob3VsZCBiZSBpdHMgYW5kIG5vdCBpdCdzIDwvYmx1c2g+Cgo+IGV4aXN0aW5nIGxvZ2ljIHdp
dGggYSBjYWxsIHRvIHNvcnQoKS4KPiAKPiBhbmQgYmVmb3JlIHlvdXIgU09CIGFkZDoKPiBTdWdn
ZXN0ZWQtYnk6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJuZWwub3JnPgo+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBNYWhtb3VkIE1hYXR1cSA8bWFobW91ZG1hdG9vay5tbUBnbWFpbC5jb20+Cj4+IC0t
LQo+PiBjaGFuZ2VzIGluIHYxOgo+PiAtIHJlcGxhY2UgdGhlIGVudGlyZSBkb3VibGUgbG9vcCB3
aXRoIHNvcnQoKQo+PiDCoMKgIGFzIHN1Z2dlc3RlZCBieSBKaXJpIFNsYWJ5IDxqaXJpc2xhYnlA
a2VybmVsLm9yZz4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9w
aHkuYyB8IDI5ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL3BoeS5jIAo+PiBiL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGg1ay9waHkuYwo+PiBpbmRleCA1Nzk3ZWY5YzczZDcuLjdlZTRlMTYxNmY0
NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL3BoeS5jCj4+
ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9waHkuYwo+PiBAQCAtMjYsNiAr
MjYsNyBAQAo+PiDCoCAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPj4gwqAgI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zb3J0Lmg+Cj4+IMKgICNpbmNsdWRlIDxh
c20vdW5hbGlnbmVkLmg+Cj4+IMKgICNpbmNsdWRlICJhdGg1ay5oIgo+PiBAQCAtMTU1NCw2ICsx
NTU1LDExIEBAIHN0YXRpYyB2b2lkIGF0aDVrX2h3X3VwZGF0ZV9uZmNhbF9oaXN0KHN0cnVjdCAK
Pj4gYXRoNWtfaHcgKmFoLCBzMTYgbm9pc2VfZmxvb3IpCj4+IMKgwqDCoMKgwqAgaGlzdC0+bmZ2
YWxbaGlzdC0+aW5kZXhdID0gbm9pc2VfZmxvb3I7Cj4+IMKgIH0KPj4gK3N0YXRpYyBpbnQgY21w
czE2KGNvbnN0IHZvaWQgKmEsIGNvbnN0IHZvaWQgKmIpCj4+ICt7Cj4+ICvCoMKgwqAgcmV0dXJu
ICooczE2ICopYSAtICooczE2ICopYjsKPj4gK30KPj4gKwo+PiDCoCAvKioKPj4gwqDCoCAqIGF0
aDVrX2h3X2dldF9tZWRpYW5fbm9pc2VfZmxvb3IoKSAtIEdldCBtZWRpYW4gTkYgZnJvbSBoaXN0
b3J5IAo+PiBidWZmZXIKPj4gwqDCoCAqIEBhaDogVGhlICZzdHJ1Y3QgYXRoNWtfaHcKPj4gQEAg
LTE1NjEsMjUgKzE1NjcsMTYgQEAgc3RhdGljIHZvaWQgYXRoNWtfaHdfdXBkYXRlX25mY2FsX2hp
c3Qoc3RydWN0IAo+PiBhdGg1a19odyAqYWgsIHMxNiBub2lzZV9mbG9vcikKPj4gwqAgc3RhdGlj
IHMxNgo+PiDCoCBhdGg1a19od19nZXRfbWVkaWFuX25vaXNlX2Zsb29yKHN0cnVjdCBhdGg1a19o
dyAqYWgpCj4+IMKgIHsKPj4gLcKgwqDCoCBzMTYgc29ydFtBVEg1S19ORl9DQUxfSElTVF9NQVhd
Owo+PiAtwqDCoMKgIHMxNiB0bXA7Cj4+IC3CoMKgwqAgaW50IGksIGo7Cj4+IC0KPj4gLcKgwqDC
oCBtZW1jcHkoc29ydCwgYWgtPmFoX25mY2FsX2hpc3QubmZ2YWwsIHNpemVvZihzb3J0KSk7Cj4+
IC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IEFUSDVLX05GX0NBTF9ISVNUX01BWCAtIDE7IGkrKykg
ewo+PiAtwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMTsgaiA8IEFUSDVLX05GX0NBTF9ISVNUX01B
WCAtIGk7IGorKykgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc29ydFtqXSA+IHNv
cnRbaiAtIDFdKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG1wID0gc29y
dFtqXTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzb3J0W2pdID0gc29ydFtq
IC0gMV07Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc29ydFtqIC0gMV0gPSB0
bXA7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4g
LcKgwqDCoCB9Cj4+ICvCoMKgwqAgczE2IHNvcnRlZF9uZnZhbFtBVEg1S19ORl9DQUxfSElTVF9N
QVhdOwo+PiArwqDCoMKgIGludCBpOwo+PiArCj4+ICvCoMKgwqAgbWVtY3B5KHNvcnRlZF9uZnZh
bCwgYWgtPmFoX25mY2FsX2hpc3QubmZ2YWwsIHNpemVvZihzb3J0ZWRfbmZ2YWwpKTsKPj4gK8Kg
wqDCoCBzb3J0KHNvcnRlZF9uZnZhbCwgQVRINUtfTkZfQ0FMX0hJU1RfTUFYLCBzaXplb2YoczE2
KSwgY21wczE2LCAKPj4gTlVMTCk7Cj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFUSDVL
X05GX0NBTF9ISVNUX01BWDsgaSsrKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBBVEg1S19EQkco
YWgsIEFUSDVLX0RFQlVHX0NBTElCUkFURSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImNh
bCAlZDolZFxuIiwgaSwgc29ydFtpXSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJjYWwg
JWQ6JWRcbiIsIGksIHNvcnRlZF9uZnZhbFtpXSk7Cj4+IMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKg
IHJldHVybiBzb3J0WyhBVEg1S19ORl9DQUxfSElTVF9NQVggLSAxKSAvIDJdOwo+PiArwqDCoMKg
IHJldHVybiBzb3J0ZWRfbmZ2YWxbKEFUSDVLX05GX0NBTF9ISVNUX01BWCAtIDEpIC8gMl07Cj4+
IMKgIH0KPj4gwqAgLyoqCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVs
LW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
