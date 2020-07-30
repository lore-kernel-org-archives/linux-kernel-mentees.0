Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559D0C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 05:58:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19DB12083B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 05:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKn1y7Hx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19DB12083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C58CE2050C;
	Thu, 30 Jul 2020 05:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDR59JalPzeD; Thu, 30 Jul 2020 05:58:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F1CEA2305A;
	Thu, 30 Jul 2020 05:58:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8D8DC004D;
	Thu, 30 Jul 2020 05:58:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89DC3C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 842778815F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpLqcjVeeA+1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3154388184
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 05:58:43 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id a26so906598ejc.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IAoTwvssfsWUMQsY9ak3cq0wR9KCIhNThNsjepDyRwQ=;
 b=dKn1y7HxLHmjpQTyJW7X+RsRlljgI8xQco6QX2Sff2ZbMzjvDCioNAC/Tka7RXXg+d
 QtUr+TroAF2McWFShmZtuzJb0Z6t+/w760qhbt7wPXZCo7e6W5BSrF5j+RdHwkvk4wS+
 L6A5z4VulNYVFb6SqSDDtKV41c0hcWnZwuHpQ23Tt0eYtfU98F70Y6WqBdWDJifP9RH8
 QrBFfCnXzdpiyyEwjg5/pgVZ/i4H+kJjHqS5bj/UroaAf4xzhawcTRuFOIdnXUNIpEyj
 RumplsqM723RrxBTIfGjfECg+SF9KJC7z45C1trHufbSSUFlpk+mz9ORjIor7w1N6OJ2
 zByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IAoTwvssfsWUMQsY9ak3cq0wR9KCIhNThNsjepDyRwQ=;
 b=qhkHeqkFl96hV3JHqbQ+XGuRqFO+ml+0mTB58obLXI2X+eHgye1bqbx1oZSaivtrLK
 FDczfEoR12wY0go/oijHM7gUnerwJ864j5UtY3d8Hnv/eQmgZkJpr/MIcacEXPzMTF2L
 KtErsVhUqpjNPmJLdHyckwV/fWxjCjnSwHCOomxKfY7AL1gxCnsiQdDMYJwE3jdyzuQ5
 VHn4nRFN4XM7ZVFBqL6TfVWV8irWxN/lY9CdNxDZt3gVKoPQrIYwnWggLy/MVrwUB6sy
 hDwllXHNx7v/YcBrCZ8CK/9pV0/bTarhyZYFByPitY2jBcRMgvRgkRg5hYIKgnKd7a27
 iBGQ==
X-Gm-Message-State: AOAM531tUKZWip6zC+eBAHvK/4WBXm9FlADRbblcGkv7qv59uEnVL54i
 HYNivM9lcDkQeII0jlWmdyE=
X-Google-Smtp-Source: ABdhPJzUOY3x2BdBSICrBBmMp6brcvGJXLO17FFIn71N4JX99Cih8wJw/y7ACWjKWlADe/8JRI3Chg==
X-Received: by 2002:a17:906:3790:: with SMTP id
 n16mr1055673ejc.256.1596088721345; 
 Wed, 29 Jul 2020 22:58:41 -0700 (PDT)
Received: from felia ([2001:16b8:2d08:ee00:c941:ef07:9c8a:8408])
 by smtp.gmail.com with ESMTPSA id a18sm4823135ejt.69.2020.07.29.22.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 22:58:40 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 30 Jul 2020 07:58:28 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>, joe@perches.com
In-Reply-To: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2007300746330.13710@felia>
References: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: apw@canonical.com, Linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: Fix the usage of
	capture group ( ... )
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



On Tue, 14 Jul 2020, Mrinal Pandey wrote:

> The usage of "capture group (...)" in the immediate condition after `&&`
> results in `$1` being uninitialized. This issues a warning "Use of
> uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
> line 2638".
> 
> I noticed this bug while running checkpatch on the set of commits from
> v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in
> their commit message.
> 
> This bug was introduced in the script by commit e518e9a59ec3
> ("checkpatch: emit an error when there's a diff in a changelog"). It has
> been in the script since then.
> 
> The author intended to store the match made by capture group in variable
> `$1`. This should have contained the name of the file as `[\w/]+` matched.
> However, this couldn't be accomplished due to usage of capture group and
> `$1` in the same regular expression.
> 
> Fix this by placing the capture group in the condition before `&&`.
> Thus, `$1` can be initialized to the text that capture group matches
> thereby setting it to the desired and required value.
> 
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---
> Changes since v1:
> Add Reviewed-by and Tested-by tag
>

Hi Joe,

did you see this quick fix to checkpatch.pl? Can you comment on the 
commit and can we get a quick ack on that fix, please?

General question on patches for ./scripts/checkpatch.pl:

How do they travel to Linus?

Do you pick those patches and provide them to Andrew Morton?
Or do you just ack them and we need to send them to Andrew Morton to get 
them into mainline?

(get_maintainers tells us to just send those patches to you and Andy.)


Lukas


>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4c820607540b..e73e998d582a 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2636,8 +2636,8 @@ sub process {
>  
>  # Check if the commit log has what seems like a diff which can confuse patch
>  		if ($in_commit_log && !$commit_log_has_diff &&
> -		    (($line =~ m@^\s+diff\b.*a/[\w/]+@ &&
> -		      $line =~ m@^\s+diff\b.*a/([\w/]+)\s+b/$1\b@) ||
> +		    (($line =~ m@^\s+diff\b.*a/([\w/]+)@ &&
> +		      $line =~ m@^\s+diff\b.*a/[\w/]+\s+b/$1\b@) ||
>  		     $line =~ m@^\s*(?:\-\-\-\s+a/|\+\+\+\s+b/)@ ||
>  		     $line =~ m/^\s*\@\@ \-\d+,\d+ \+\d+,\d+ \@\@/)) {
>  			ERROR("DIFF_IN_COMMIT_MSG",
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
