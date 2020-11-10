Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338F6C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:27:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6161920797
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTPKl01K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6161920797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C9ABE87193;
	Tue, 10 Nov 2020 15:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxhvVBCc-5Ha; Tue, 10 Nov 2020 15:27:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30C168715D;
	Tue, 10 Nov 2020 15:27:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20342C088B;
	Tue, 10 Nov 2020 15:27:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 496D2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3431C866AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKsFL+NOLeoS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6255B86667
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:27:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id z1so6630666plo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dyCNtuYZNH+z7MnlS4ALkhOr6Vy+hsFFaBWaCZonz0E=;
 b=CTPKl01KkUTy7TL4XZShXjIIWNGlDdP1ATfthc9W+E/XJ2QAf/zO+uTl3SPuSfUWdV
 8yTRmmzH9DzRxdExQISDtSZWPipCuxPOLz/8SvCx6y2d0HKbtr66gl/P1EswdfAaonEQ
 9gLq1pRUfx/pjPhVn0Z4IfV6b4Thfnt4JCVfrtwZZLMwRs5miWTyPik8DqiLWpv33wJI
 655L0ZZNksiBma0t+hKji0z4JvwPmKRZ7D1C/sdZ4CZGcsBSF7LGQb6uS0La97RasTD1
 65DhXC+tx3f6csV5k4tsO6QZWPIjcpxkImEsVIs03q7cTfHzqrjlXc4HytxsuqHKPgz5
 e//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dyCNtuYZNH+z7MnlS4ALkhOr6Vy+hsFFaBWaCZonz0E=;
 b=J5lLXyM1JcHdijyeDv7A6rNmdjiur1jdeK91M8q9UNt4lIzJYVdcreWF77B9BbsNft
 9k6KDTg20oWuWLwF1e6U0/tpHqavW0D7uIgS/8W3/fzUwLHr2JR44DTB4nTCjaJCh7W+
 4qX6evaoLSinQ3qJA/x6VVwztIRQpAPt6Sn8FhN5zwSgJiBe/YYTTtxWiq31uqBm+Peu
 7dpjRsXyDXb9Jpa+UBDjLjHZaNZdt2lWoc03O+ZeO5/S8526C+LE50gwzqN2yKcgkebx
 68IvSm0Rqnr4u9UuYlvoLO5PPJ1kYInPGy+2faNYSFBb32LUR/0y5Szdc4qnLnkfydNW
 1aTw==
X-Gm-Message-State: AOAM532D9MsTehSJFIdmwd6pk1LuYnmjCeumXbXXZ6wlPnKGwilmHsrf
 bXS/rTXOxFNPPw0zcj/KsRfaoOVXE5uO3w==
X-Google-Smtp-Source: ABdhPJzgZVr/Yi/s2PCci4VOQ+rj7telH/b3odfnVtzdw4+eQ64dDkNceZt/5EAlAYRfpiLgMiWzQQ==
X-Received: by 2002:a17:902:d211:b029:d7:cd5e:2857 with SMTP id
 t17-20020a170902d211b02900d7cd5e2857mr14053992ply.45.1605022019593; 
 Tue, 10 Nov 2020 07:26:59 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id s4sm3393050pjp.17.2020.11.10.07.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 07:26:58 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201110134214.24082-1-yashsri421@gmail.com>
 <CAKXUXMzSQX-NjOw1KBHMfag1GkizAJvLpyopjiRdOf+6K1r-KA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <0ae65118-d18e-5820-e7d4-2dd816251788@gmail.com>
Date: Tue, 10 Nov 2020 20:56:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzSQX-NjOw1KBHMfag1GkizAJvLpyopjiRdOf+6K1r-KA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Documentation:
	include sign off for reverts
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

On 10/11/20 8:19 pm, Lukas Bulwahn wrote:
> On Tue, Nov 10, 2020 at 2:42 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently, we do not have any documentation on commit reverts regarding
>> the requirement of Signed-off-by tag for it. This may be misleading to
>> the users.
>>
>> On evaluating MISSING_SIGN_OFF over v4.13..v5.8, it was found that
> Just some minor nitpicking on wording:
> 
> Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed that
>> 4 out of 11 cases for this error is because of missing sign offs in
> 
> 4 out of 11 cases missing a sign-off are revert commits.
> 
>> revert commits.
>>
>> Add documentation regarding the same.
>>
> 
> ...to document the community consensus and let readers know.
> 
> Send the revised patch out to the appropriate developers and mailing
> lists and please CC me and Joe (because it is also on checkpatch
> rules).
> 
Thanks for reviewing. I have updated the message.
Actually when I ran ./scripts/get_maintainer.pl over this patch I am
getting a long list of maintainers, so I wanted to confirm once if I
should send to everyone in this list.

Jonathan Corbet <corbet@lwn.net>
(maintainer:DOCUMENTATION,commit_signer:9/11=82%)
Drew DeVault <sir@cmpwn.com>
(commit_signer:4/11=36%,authored:4/11=36%,added_lines:53/80=66%,removed_lines:212/228=93%)
Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
(commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%,removed_lines:13/228=6%)
Krzysztof Kozlowski <krzk@kernel.org>
(commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:1/11=9%)
Aditya Srivastava <yashsri421@gmail.com> (authored:1/11=9%)
"Alexander A. Klimov" <grandmaster@al2klimov.de> (authored:1/11=9%)
Tom Rix <trix@redhat.com> (added_lines:5/80=6%)
linux-doc@vger.kernel.org (open list:DOCUMENTATION)
linux-kernel@vger.kernel.org (open list)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
