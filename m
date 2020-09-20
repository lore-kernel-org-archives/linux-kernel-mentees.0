Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42921C43465
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 08:02:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC25D20708
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 08:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyTYD6dF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC25D20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 20D0786C4D;
	Sun, 20 Sep 2020 08:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFFvNlSJxTLu; Sun, 20 Sep 2020 08:02:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FD7686B55;
	Sun, 20 Sep 2020 08:02:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2C6CC088B;
	Sun, 20 Sep 2020 08:02:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F960C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 388C085DF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzmcMASa9_GC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:01:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 36A4985DCA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 08:01:59 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id r7so13536816ejs.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 01:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=E3n9fYdebM7dugsK43TQ4g3T2mlPhz1YvXvBWCtGcZA=;
 b=KyTYD6dFV4cQja4sxXVaexGt8M24mCn9WsLgpf1SrZZ6fD4pC3wY0QtlhHg2msuG+u
 f7VYNSKotBzla7HRzQhV7pHNwc73VxcbkC6Uga4XN8eW+iGdBWWeHMw4+OG+/mmWai5U
 PnfaGqlYfMXk+bfn65rNbVE+ipFWYuOWG7eTCY3MXOw6jQeA6IuOpsPOasonU35ldLwb
 D00av7XOCZluR0zmvnZoJhigoh00tZ0w0rerU2IU6tc0hujHY+WGWsHwCljebWbZJG8w
 UAJVe0vr/HydTNtHvOT5APQ5OSZrj2gWCHsuZfEX3RJ7iuG4Mq7L+J7dFjvbH+4wyDvK
 6xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=E3n9fYdebM7dugsK43TQ4g3T2mlPhz1YvXvBWCtGcZA=;
 b=PfjD9MysDQajiB0Vi2O77VgheAcTdsn9HwyS5yKbh4GDdnAE08qmYmJGhT7i5WtWNS
 fZOQU3byEVKlpTngN8SrMGXlvrTPs3Dz/fv58AtqtfW+3V19E1rGG0G24P73mPO4/QwO
 e2AfbdYqrUewrxTsCCV2sYWeX9Zim5gfBRXv9zIlvyVbxjKJ3O5VEJnJ1AVc2t3qjp1+
 ghaYF4N5QFki5w5t0AJTiakoe1+JZNTqs0dQwA9n64pTROVv/7ZGY/kjboAFmBMGJUjM
 D29tThqKDVnHw54hErSmdv4yNmDvOiY6G88IU8EhokmefiywGRsXU8qtg8hu44hCMKIw
 2s0Q==
X-Gm-Message-State: AOAM531y75ya6cytnQ7rQPLfpKZejCucgOxWthmQTd3aLJBWakVbIuyL
 cnCyyv1V4XsNM70uU+wg+fc=
X-Google-Smtp-Source: ABdhPJxSsfIh4F7dVs9o1WMIMFtUvRqP4U6s6VhTOGo6/gjBFYSuzXlastqwXZo9BcqMZyJqGn0fHA==
X-Received: by 2002:a17:906:a88a:: with SMTP id
 ha10mr46956378ejb.532.1600588917501; 
 Sun, 20 Sep 2020 01:01:57 -0700 (PDT)
Received: from felia ([2001:16b8:2da4:9100:d08c:280d:91ba:79ee])
 by smtp.gmail.com with ESMTPSA id o15sm6092408ejr.1.2020.09.20.01.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 01:01:56 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 20 Sep 2020 10:01:50 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20200919204721.100531-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2009200958110.12902@felia>
References: <20200919204721.100531-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
 Signed-off-by check for split From: header
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



On Sun, 20 Sep 2020, Dwaipayan Ray wrote:

> Checkpatch did not handle cases where the author From: header
> was split into multiple lines. The author identity could not
> be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> warning.
> 
> Support split From: headers in AUTHOR_SIGN_OFF check by correctly
> parsing the entire From: header in such cases.
>

Looks good to me.

Maybe you can some examples that are now handled better, typical cases of 
the different classes and a summary on your evaluation in the commit 
message.

Do that and send out the PATCH v2 to the linux-kernel mailing list with 
the typical recipients.

Lukas
 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..8ee61ec346b3 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2661,6 +2661,10 @@ sub process {
>  # Check the patch for a From:
>  		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>  			$author = $1;
> +			my $curline = $linenr-1;
> +			while(defined($rawlines[++$curline]) && ($rawlines[$curline] =~ /^\s+(.*)/)) {
> +				$author.= $1;
> +			}
>  			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>  			$author =~ s/"//g;
>  			$author = reformat_email($author);
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
