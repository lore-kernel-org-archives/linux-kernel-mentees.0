Return-Path: <SRS0=xLm4=FU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292A2C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:54:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B68A23339
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B68A23339
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 45A02227DB;
	Wed, 16 Dec 2020 12:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrFi0a8+YPdR; Wed, 16 Dec 2020 12:54:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B42BF227AA;
	Wed, 16 Dec 2020 12:54:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88EE7C088E;
	Wed, 16 Dec 2020 12:54:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FB5CC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E5008486F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7iGH-qR7rju
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:54:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ECBD6847E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:54:50 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id c22so2153778pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QYRDMV81HBB9n3GfLCOCtpO3eA3hbzwpCwzsxpstXL4=;
 b=Ll1oTtNmEDWMAFKp08JcIPb4UeaAmi2MAuPT5KqMe7FDTUgmtjoDF90cGQgvrT6xda
 o4CZQOxxth/75MVdDGrS84P7vmyzHx8z4ZLmKqe+dSQoFhhlMPKmjQO8Dwz9J4n/8dc0
 tPlFA+5d/zrfIjfpkD1Dv5mnUk8D0aWWyerCWjMbAOMF8uF75Oz058GyIP05oJQlMsjg
 j1IDMgvWWPHzp0mAH1SmX9PvEdreDHQu/xB4yNler+vXmHAexMWNDfktyJRs+4WBBdDY
 WutC1mJrXbh3mWv41XtkW4QP1zawL5XFHwgqBjTlLFKMNDf4oosGX+29vxLU4ppVhxza
 k5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QYRDMV81HBB9n3GfLCOCtpO3eA3hbzwpCwzsxpstXL4=;
 b=jqFD3s2ZzZ5FLb7AF2NouJUzwMqJxDApK8ksEZ7qDg4VnWWe0uKio9rgDJnUULFPD2
 Jvqhgb7fKyBUJ2qajYztHzXRhUFrMtzeVjT7p98ALanrO9OBr+CtVIVqzpzhXa9H7nNb
 r11Ec4sRMMsD2ZcFRsBvllMV3F7oLit/+b+PqwqTctVod0hC33WtF0U6sJBAXWXxHDmI
 LHNO0qITL25HMKUXRpnvHs13+I242W1juiKfgE0ok6cz7TpfQ2KFxnul+ZOXS7W92V46
 0o/F9Jg32gP6RF81cHsU7HcE0apNklEXQD4aOrYIqktrZMXNGD8nRRxInBdzoPj+0sRA
 aDWg==
X-Gm-Message-State: AOAM532zJ37wWsUeFq+qniobQTQcx6tZjq/BoIfp9xgu0NG5E7na2Gcv
 6aiiIqs8FpFZO5zkA6BmYr+TkF2qbqg=
X-Google-Smtp-Source: ABdhPJwLFEq7KPLE6BVfL1bWIN3jQ4Ajppy5DD9nHuwfsZhIrLniF3Ixv3KIjzf4HsBjsz4UiARMmA==
X-Received: by 2002:a62:1b14:0:b029:19d:fa85:9f73 with SMTP id
 b20-20020a621b140000b029019dfa859f73mr31450184pfb.25.1608123290163; 
 Wed, 16 Dec 2020 04:54:50 -0800 (PST)
Received: from ?IPv6:2402:3a80:416:5db1:d400:1940:d60a:6bcd?
 ([2402:3a80:416:5db1:d400:1940:d60a:6bcd])
 by smtp.gmail.com with ESMTPSA id b72sm2342043pfb.129.2020.12.16.04.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 04:54:49 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201216123121.16466-1-yashsri421@gmail.com>
 <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <53238abd-2fdc-e9fb-bef5-4b583ccb14e2@gmail.com>
Date: Wed, 16 Dec 2020 18:24:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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

On 16/12/20 6:05 pm, Lukas Bulwahn wrote:
> On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch warns for long line in commit messages even for
>> URL lines.
>>
>> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
>> this class, around 790 are due to the line containing link.
>>
>> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
>> Consolidate how dtexts and dvalues are freed") reports this warning:
>>
>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
>>
>> Avoid giving users warning for character limit, instead suggest them to
>> prefix the URLs with "Link:"
>>
> 
> Looks good to me. This might be also a good one for a fix option.
> 

I agree. Should I add the fix in this patch itself?

Thanks
Aditya

> Lukas
> 
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index abd5a3d2e913..23da1f50fe6a 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3032,8 +3032,14 @@ sub process {
>>                       $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
>>                                         # A Fixes: or Link: line or signature tag line
>>                       $commit_log_possible_stack_dump)) {
>> -                       WARN("COMMIT_LOG_LONG_LINE",
>> -                            "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
>> +                       if ($line =~ /(?:http|https|ftp):\/\//) {
>> +                               WARN("COMMIT_LOG_LONG_LINE",
>> +                                    "Consider prefixing the URL with 'Link:'\n" . $herecurr);
>> +                       }
>> +                       else {
>> +                               WARN("COMMIT_LOG_LONG_LINE",
>> +                                    "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
>> +                       }
>>                         $commit_log_long_line = 1;
>>                 }
>>
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
