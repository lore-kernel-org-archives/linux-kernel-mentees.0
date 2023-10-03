Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7126E7AD77
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Oct 2023 16:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68CAA416C4;
	Tue,  3 Oct 2023 16:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68CAA416C4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Ohzgz7ht
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SrlyQsfNPWv; Tue,  3 Oct 2023 16:41:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E5B9B417C4;
	Tue,  3 Oct 2023 16:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B9B417C4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDC28C0071;
	Tue,  3 Oct 2023 16:41:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 447CFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 16:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09BBD417C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 16:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09BBD417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYkQCnma8pdn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 16:41:10 +0000 (UTC)
X-Greylist: delayed 598 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Oct 2023 16:41:10 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95FCB416C4
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95FCB416C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 16:41:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 93AEA2B4;
 Tue,  3 Oct 2023 16:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 93AEA2B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1696350671; bh=Gehdcdnf+A4CsEvU65+tetDAgnqQs9RkmnesjHWCM08=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=Ohzgz7htoFlZeGQCP6pIrq1QIAoIxUyNPAZ2Feb+Hi7yqoYx+aJikuJWnzMibvfSx
 a9jMFb6bgTVBqyHPR4XipyfgQKbLhPzE2Vl4qia/GsE33wJv6hXwV41mSBbUkAjWbA
 3ukODpRmXqZGps2T7zYq2XmCqxJhCMG6hQPWY3L7lsNYBt6gBJwwc+cvSepXPJhGbV
 DbObOhDJkwdvzhghNBbIug1NACrIOVgjscJDDAVsHAAGq8o8sPa5MuTYSoUOOYk6ov
 s26wC8rFb76KSS8iDEoKPxHaplQzqRKKpaOpBB5MooD5IGd/in/Y7SgtcALyyKe6gd
 bjmcasDAeKFTg==
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Claudio Cambra
 <developer@claudiocambra.com>, skhan@linuxfoundation.org,
 ivan.orlov0322@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: Fix Sphinx 8 warning caused by paths represented
 with strings
In-Reply-To: <5fd1b5cd-ea6c-44a1-9cb5-8f692d32ec99@infradead.org>
References: <20230924184057.91861-1-developer@claudiocambra.com>
 <5fd1b5cd-ea6c-44a1-9cb5-8f692d32ec99@infradead.org>
Date: Tue, 03 Oct 2023 10:31:10 -0600
Message-ID: <87y1gjd5wx.fsf@meer.lwn.net>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> On 9/24/23 11:40, Claudio Cambra wrote:
>> Running "make htmldocs" generates several lines of this warning:
>> 
>> Documentation/sphinx/kerneldoc.py:141: RemovedInSphinx80Warning: Sphinx 8 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
>>   doc = (env.srcdir + "/" + env.docname + ":" + str(self.lineno))
>> 
>> Making "doc" an fspath type and creating a new variable with the
>> appended colon and lineno fixes this warning.
>> 
>> Signed-off-by: Claudio Cambra <developer@claudiocambra.com>
>> ---
>>  Documentation/sphinx/kerneldoc.py | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
>> index 9395892c7ba3..e2c835e10dba 100644
>> --- a/Documentation/sphinx/kerneldoc.py
>> +++ b/Documentation/sphinx/kerneldoc.py
>> @@ -138,7 +138,8 @@ class KernelDocDirective(Directive):
>>                      lineoffset = int(match.group(1)) - 1
>>                      # we must eat our comments since the upset the markup
>>                  else:
>> -                    doc = env.srcdir + "/" + env.docname + ":" + str(self.lineno)
>> +                    doc = os.path.join(env.srcdir, env.docname)
>> +                    doc_with_line = (doc + ":" + str(self.lineno))
>>                      result.append(line, doc + ": " + filename, lineoffset)
>>                      lineoffset += 1
>>  
>
> This patch should be sent to the linux-doc@vger.kernel.org mailing list,
> with the Documentation maintainer copied on the patch.
>
> We also have this similar patch to consider:
>   https://lore.kernel.org/linux-doc/20230910040811.53046-1-erer1243@gmail.com/

I have, in fact, applied that other patch.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
