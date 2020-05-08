Return-Path: <SRS0=QHLe=6W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A38EC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 May 2020 00:24:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FCCB208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 May 2020 00:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FCCB208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 343FC86A70;
	Fri,  8 May 2020 00:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id remoKNO08pId; Fri,  8 May 2020 00:24:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5683A869D3;
	Fri,  8 May 2020 00:24:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46F22C0865;
	Fri,  8 May 2020 00:24:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01F9CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D7EBF879C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytCDqBkdnfyN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:24:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 078F9879AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:24:03 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04802tMJ127321; Thu, 7 May 2020 20:23:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30vtwc2ca0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 20:23:47 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0480K9Dq165442;
 Thu, 7 May 2020 20:23:47 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30vtwc2c9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 20:23:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0480Kt1X007960;
 Fri, 8 May 2020 00:23:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 30s0g5va3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 May 2020 00:23:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0480Nh4G46661768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 May 2020 00:23:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B4E52051;
 Fri,  8 May 2020 00:23:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.135.201])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0674E5204F;
 Fri,  8 May 2020 00:23:41 +0000 (GMT)
Message-ID: <1588897421.5685.152.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, madhuparnabhowmik10@gmail.com
Date: Thu, 07 May 2020 20:23:41 -0400
In-Reply-To: <20200508101402.267ca0f2@canb.auug.org.au>
References: <20200430160205.17798-1-madhuparnabhowmik10@gmail.com>
 <20200508101402.267ca0f2@canb.auug.org.au>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_17:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2005070183
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, joel@joelfernandes.org,
 linux-integrity@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, serge@hallyn.com
Subject: Re: [Linux-kernel-mentees] [PATCH] integrity: evm: Fix RCU list
	related warnings.
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

SGkgU3RlcGhlbiwKCk9uIEZyaSwgMjAyMC0wNS0wOCBhdCAxMDoxNCArMTAwMCwgU3RlcGhlbiBS
b3Rod2VsbCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gT24gVGh1LCAzMCBBcHIgMjAyMCAyMTozMjow
NSArMDUzMCBtYWRodXBhcm5hYmhvd21pazEwQGdtYWlsLmNvbSB3cm90ZToKPiA+Cj4gPiBGcm9t
OiBNYWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMTBAZ21haWwuY29tPgo+ID4g
Cj4gPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBhbmQgZmV3IG90aGVy
Cj4gPiBpbnN0YW5jZXMgb2YgdHJhdmVyc2FsIG9mIGV2bV9jb25maWdfeGF0dHJuYW1lcyBsaXN0
Ogo+ID4gCj4gPiBbICAgMzIuODQ4NDMyXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
ID4gWyAgIDMyLjg0ODcwN10gV0FSTklORzogc3VzcGljaW91cyBSQ1UgdXNhZ2UKPiA+IFsgICAz
Mi44NDg5NjZdIDUuNy4wLXJjMS0wMDAwNi1nYThkNTg3NWNlNWYwYiAjMSBOb3QgdGFpbnRlZAo+
ID4gWyAgIDMyLjg0OTMwOF0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IFsgICAz
Mi44NDk1NjddIHNlY3VyaXR5L2ludGVncml0eS9ldm0vZXZtX21haW4uYzoyMzEgUkNVLWxpc3Qg
dHJhdmVyc2VkIGluIG5vbi1yZWFkZXIgc2VjdGlvbiEhCj4gPiAKPiA+IFNpbmNlIGVudHJpZXMg
YXJlIG9ubHkgYWRkZWQgdG8gdGhlIGxpc3QgYW5kIG5ldmVyIGRlbGV0ZWQsCj4gPiB1c2UgbGlz
dF9Gb3JfZWFjaF9lbnRyeV9sb2NrbGVzcygpIGluc3RlYWQgb2YKPiA+IGxpc3RfZm9yX2VhY2hf
ZW50cnlfcmN1KCkgZm9yIHRyYXZlcnNpbmcgdGhlIGxpc3QuCj4gPiBBbHNvLCBhZGQgYSByZWxl
dmFudCBjb21tZW50IGluIGV2bV9zZWNmcy5jIHRvIGluZGljYXRlIHRoaXMgZmFjdC4KPiA+IAo+
ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gU3Vn
Z2VzdGVkLWJ5OiBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMTBAZ21haWwu
Y29tPgo+ID4gQWNrZWQtYnk6IFBhdWwgRS4gTWNLZW5uZXkgPHBhdWxtY2tAa2VybmVsLm9yZz4K
PiA+IC0tLQo+ID4gIHNlY3VyaXR5L2ludGVncml0eS9ldm0vZXZtX2NyeXB0by5jIHwgMiArLQo+
ID4gIHNlY3VyaXR5L2ludGVncml0eS9ldm0vZXZtX21haW4uYyAgIHwgNCArKy0tCj4gPiAgc2Vj
dXJpdHkvaW50ZWdyaXR5L2V2bS9ldm1fc2VjZnMuYyAgfCA5ICsrKysrKysrLQo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL3NlY3VyaXR5L2ludGVncml0eS9ldm0vZXZtX2NyeXB0by5jIGIvc2VjdXJpdHkv
aW50ZWdyaXR5L2V2bS9ldm1fY3J5cHRvLmMKPiA+IGluZGV4IDM1NjgyODUyZGRlYS4uYjJkYzg3
ZGE1ZjUwIDEwMDY0NAo+ID4gLS0tIGEvc2VjdXJpdHkvaW50ZWdyaXR5L2V2bS9ldm1fY3J5cHRv
LmMKPiA+ICsrKyBiL3NlY3VyaXR5L2ludGVncml0eS9ldm0vZXZtX2NyeXB0by5jCj4gPiBAQCAt
MjA3LDcgKzIwNyw3IEBAIHN0YXRpYyBpbnQgZXZtX2NhbGNfaG1hY19vcl9oYXNoKHN0cnVjdCBk
ZW50cnkgKmRlbnRyeSwKPiA+ICAJZGF0YS0+aGRyLmxlbmd0aCA9IGNyeXB0b19zaGFzaF9kaWdl
c3RzaXplKGRlc2MtPnRmbSk7Cj4gPiAgCj4gPiAgCWVycm9yID0gLUVOT0RBVEE7Cj4gPiAtCWxp
c3RfZm9yX2VhY2hfZW50cnlfcmN1KHhhdHRyLCAmZXZtX2NvbmZpZ194YXR0cm5hbWVzLCBsaXN0
KSB7Cj4gPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfbG9ja2xlc3MoeGF0dHIsICZldm1fY29uZmln
X3hhdHRybmFtZXMsIGxpc3QpIHsKPiA+ICAJCWJvb2wgaXNfaW1hID0gZmFsc2U7Cj4gPiAgCj4g
PiAgCQlpZiAoc3RyY21wKHhhdHRyLT5uYW1lLCBYQVRUUl9OQU1FX0lNQSkgPT0gMCkKPiA+IGRp
ZmYgLS1naXQgYS9zZWN1cml0eS9pbnRlZ3JpdHkvZXZtL2V2bV9tYWluLmMgYi9zZWN1cml0eS9p
bnRlZ3JpdHkvZXZtL2V2bV9tYWluLmMKPiA+IGluZGV4IGQzNjFkN2ZkYWZjNC4uMGQzNjI1OWI2
OTBkIDEwMDY0NAo+ID4gLS0tIGEvc2VjdXJpdHkvaW50ZWdyaXR5L2V2bS9ldm1fbWFpbi5jCj4g
PiArKysgYi9zZWN1cml0eS9pbnRlZ3JpdHkvZXZtL2V2bV9tYWluLmMKPiA+IEBAIC05Nyw3ICs5
Nyw3IEBAIHN0YXRpYyBpbnQgZXZtX2ZpbmRfcHJvdGVjdGVkX3hhdHRycyhzdHJ1Y3QgZGVudHJ5
ICpkZW50cnkpCj4gPiAgCWlmICghKGlub2RlLT5pX29wZmxhZ3MgJiBJT1BfWEFUVFIpKQo+ID4g
IAkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gIAo+ID4gLQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Jj
dSh4YXR0ciwgJmV2bV9jb25maWdfeGF0dHJuYW1lcywgbGlzdCkgewo+ID4gKwlsaXN0X2Zvcl9l
YWNoX2VudHJ5X2xvY2tsZXNzKHhhdHRyLCAmZXZtX2NvbmZpZ194YXR0cm5hbWVzLCBsaXN0KSB7
Cj4gPiAgCQllcnJvciA9IF9fdmZzX2dldHhhdHRyKGRlbnRyeSwgaW5vZGUsIHhhdHRyLT5uYW1l
LCBOVUxMLCAwKTsKPiA+ICAJCWlmIChlcnJvciA8IDApIHsKPiA+ICAJCQlpZiAoZXJyb3IgPT0g
LUVOT0RBVEEpCj4gPiBAQCAtMjI4LDcgKzIyOCw3IEBAIHN0YXRpYyBpbnQgZXZtX3Byb3RlY3Rl
ZF94YXR0cihjb25zdCBjaGFyICpyZXFfeGF0dHJfbmFtZSkKPiA+ICAJc3RydWN0IHhhdHRyX2xp
c3QgKnhhdHRyOwo+ID4gIAo+ID4gIAluYW1lbGVuID0gc3RybGVuKHJlcV94YXR0cl9uYW1lKTsK
PiA+IC0JbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoeGF0dHIsICZldm1fY29uZmlnX3hhdHRybmFt
ZXMsIGxpc3QpIHsKPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9sb2NrbGVzcyh4YXR0ciwgJmV2
bV9jb25maWdfeGF0dHJuYW1lcywgbGlzdCkgewo+ID4gIAkJaWYgKChzdHJsZW4oeGF0dHItPm5h
bWUpID09IG5hbWVsZW4pCj4gPiAgCQkgICAgJiYgKHN0cm5jbXAocmVxX3hhdHRyX25hbWUsIHhh
dHRyLT5uYW1lLCBuYW1lbGVuKSA9PSAwKSkgewo+ID4gIAkJCWZvdW5kID0gMTsKPiA+IGRpZmYg
LS1naXQgYS9zZWN1cml0eS9pbnRlZ3JpdHkvZXZtL2V2bV9zZWNmcy5jIGIvc2VjdXJpdHkvaW50
ZWdyaXR5L2V2bS9ldm1fc2VjZnMuYwo+ID4gaW5kZXggMzlhZDEwMzhkNDVkLi5jZmMzMDc1NzY5
YmIgMTAwNjQ0Cj4gPiAtLS0gYS9zZWN1cml0eS9pbnRlZ3JpdHkvZXZtL2V2bV9zZWNmcy5jCj4g
PiArKysgYi9zZWN1cml0eS9pbnRlZ3JpdHkvZXZtL2V2bV9zZWNmcy5jCj4gPiBAQCAtMjMyLDcg
KzIzMiwxNCBAQCBzdGF0aWMgc3NpemVfdCBldm1fd3JpdGVfeGF0dHJzKHN0cnVjdCBmaWxlICpm
aWxlLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAo+ID4gIAkJZ290byBvdXQ7Cj4gPiAgCX0KPiA+
ICAKPiA+IC0JLyogR3VhcmQgYWdhaW5zdCByYWNlcyBpbiBldm1fcmVhZF94YXR0cnMgKi8KPiA+
ICsJLyoKPiA+ICsJICogeGF0dHJfbGlzdF9tdXRleCBndWFyZHMgYWdhaW5zdCByYWNlcyBpbiBl
dm1fcmVhZF94YXR0cnMoKS4KPiA+ICsJICogRW50cmllcyBhcmUgb25seSBhZGRlZCB0byB0aGUg
ZXZtX2NvbmZpZ194YXR0cm5hbWVzIGxpc3QKPiA+ICsJICogYW5kIG5ldmVyIGRlbGV0ZWQuIFRo
ZXJlZm9yZSwgdGhlIGxpc3QgaXMgdHJhdmVyc2VkCj4gPiArCSAqIHVzaW5nIGxpc3RfZm9yX2Vh
Y2hfZW50cnlfbG9ja2xlc3MoKSB3aXRob3V0IGhvbGRpbmcKPiA+ICsJICogdGhlIG11dGV4IGlu
IGV2bV9jYWxjX2htYWNfb3JfaGFzaCgpLCBldm1fZmluZF9wcm90ZWN0ZWRfeGF0dHJzKCkKPiA+
ICsJICogYW5kIGV2bV9wcm90ZWN0ZWRfeGF0dHIoKS4KPiA+ICsJICovCj4gPiAgCW11dGV4X2xv
Y2soJnhhdHRyX2xpc3RfbXV0ZXgpOwo+ID4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHRtcCwgJmV2
bV9jb25maWdfeGF0dHJuYW1lcywgbGlzdCkgewo+ID4gIAkJaWYgKHN0cmNtcCh4YXR0ci0+bmFt
ZSwgdG1wLT5uYW1lKSA9PSAwKSB7Cj4gCj4gSSB3aWxsIGFwcGx5IHRoaXMgdG8gbGludXgtbmV4
dCB0b2RheS4KPiAKPiBJcyB0aGVyZSBzb21ldGhpbmcgc3RvcHBpbmcgdGhpcyBiZWluZyBhcHBs
aWVkIHRvIGEgdHJlZT8gIEFuZCBkb2VzIGl0Cj4gbmVlZCB0byBiZSBzZW50IHRvIExpbnVzIHNv
b24/CgpTb3JyeSBmb3IgdGhlIGRlbGF5IGluIHB1c2hpbmcgdGhpcyBhbmQgb3RoZXIgZml4ZXMg
dG8gdGhlIG5leHQtCmludGVncml0eSBicmFuY2guIMKgSXQncyBpbiBteSBuZXh0LWludGVncml0
eS10ZXN0aW5nIGJyYW5jaC4KClRoaXMgaXNuJ3QgYSBidWcgcGVyLXNlLCBqdXN0IGFubm90YXRp
bmcgdGhlIHJlYXNvbiBmb3IgdGhlIGxhY2sgb2YKbG9ja2luZy4KCnRoYW5rcywKCk1pbWkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVs
LW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
