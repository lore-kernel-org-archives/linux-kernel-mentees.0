Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E690CE7A91
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Sep 2023 01:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04FC660BEA;
	Mon, 25 Sep 2023 01:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04FC660BEA
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com header.a=rsa-sha256 header.s=sig1 header.b=Gw0EKkij
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VhCKtWz5Mfj; Mon, 25 Sep 2023 01:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D061560BD3;
	Mon, 25 Sep 2023 01:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D061560BD3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8BD5C0039;
	Mon, 25 Sep 2023 01:08:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD58C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 01:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9146405FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 01:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9146405FB
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com
 header.a=rsa-sha256 header.s=sig1 header.b=Gw0EKkij
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EN4iflVQ4zw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 01:08:53 +0000 (UTC)
Received: from pv50p00im-ztdg10012101.me.com (pv50p00im-ztdg10012101.me.com
 [17.58.6.49]) by smtp2.osuosl.org (Postfix) with ESMTPS id 2355540520
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 01:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2355540520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=claudiocambra.com;
 s=sig1; t=1695604130;
 bh=mmjTLEufJLK2uUSLC4yOq2R8ygXXQSBU//omY9j8V1E=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 b=Gw0EKkijyJ3Hd0CI0WnL2W0TgtlQ+E0onENWfWtIMobze0058EixYKeMwP+M+LGas
 8L41UlndGjrL6tBjTHAcd8znVMyyXdAuyoiVPwpJxPPAvS+QZmo4bNxOguamP9E26T
 EEBjTMVUUdLUm0qCmi5JM+rop3GQTHbG7Gt1ZK7V9wPY5BIpwJGjj93BEdmoDtf+/a
 R+l78RjmnlBCmCNiFF3DNpxXUCFonOo7tBcC1A0wkn1UXUgFYXPMZPDivOuOLicJ2t
 czUmpFr+TtbH3KpN+iC3K3G6TwX8Em8ulLvwHUWiR4R+Rat8P842jPcGBXIPH/cOYD
 vefCB3Zpa7YzA==
Received: from [10.7.193.175] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id 67ED07400D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 01:08:48 +0000 (UTC)
Message-ID: <08f17a6c-8077-492a-bcd2-373a1d2ab831@claudiocambra.com>
Date: Mon, 25 Sep 2023 09:08:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix Sphinx 8 warning caused by paths represented
 with strings
Content-Language: en-GB
To: linux-kernel-mentees@lists.linuxfoundation.org
References: <20230924184057.91861-1-developer@claudiocambra.com>
 <5fd1b5cd-ea6c-44a1-9cb5-8f692d32ec99@infradead.org>
From: Claudio Cambra <developer@claudiocambra.com>
In-Reply-To: <5fd1b5cd-ea6c-44a1-9cb5-8f692d32ec99@infradead.org>
X-Proofpoint-ORIG-GUID: C-P6q8bJyzeGCjf37HVrF341KY7yH0fV
X-Proofpoint-GUID: C-P6q8bJyzeGCjf37HVrF341KY7yH0fV
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=392
 suspectscore=0
 spamscore=0 mlxscore=0 clxscore=1030 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2309250003
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

On 25/9/23 02:47, Randy Dunlap wrote:
> Hi,
>
> On 9/24/23 11:40, Claudio Cambra wrote:
>> Running "make htmldocs" generates several lines of this warning:
>>
>> Documentation/sphinx/kerneldoc.py:141: RemovedInSphinx80Warning: Sphinx 8 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
>>    doc = (env.srcdir + "/" + env.docname + ":" + str(self.lineno))
>>
>> Making "doc" an fspath type and creating a new variable with the
>> appended colon and lineno fixes this warning.
>>
>> Signed-off-by: Claudio Cambra <developer@claudiocambra.com>
>> ---
>>   Documentation/sphinx/kerneldoc.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
>> index 9395892c7ba3..e2c835e10dba 100644
>> --- a/Documentation/sphinx/kerneldoc.py
>> +++ b/Documentation/sphinx/kerneldoc.py
>> @@ -138,7 +138,8 @@ class KernelDocDirective(Directive):
>>                       lineoffset = int(match.group(1)) - 1
>>                       # we must eat our comments since the upset the markup
>>                   else:
>> -                    doc = env.srcdir + "/" + env.docname + ":" + str(self.lineno)
>> +                    doc = os.path.join(env.srcdir, env.docname)
>> +                    doc_with_line = (doc + ":" + str(self.lineno))
>>                       result.append(line, doc + ": " + filename, lineoffset)
>>                       lineoffset += 1
>>   
> This patch should be sent to the linux-doc@vger.kernel.org mailing list,
> with the Documentation maintainer copied on the patch.
>
> We also have this similar patch to consider:
>    https://lore.kernel.org/linux-doc/20230910040811.53046-1-erer1243@gmail.com/
>
> Thanks.

Thanks Randy, will keep in mind for future patches

Cheers,

Claudio

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
