Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B2CC43467
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 13:52:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A89E2074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 13:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p20Y80X4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A89E2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF25F85FBA;
	Mon, 12 Oct 2020 13:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pIg4cGpJGrf; Mon, 12 Oct 2020 13:52:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 71EEE855CE;
	Mon, 12 Oct 2020 13:52:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B5F4C0052;
	Mon, 12 Oct 2020 13:52:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22A41C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 111DD85FBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScXYU7P5aZoP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:52:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A326855CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:52:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e10so13582561pfj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k+H22LYyuFn0P0Ry7ATW9f9JgbPKmhFRt6Rf8v/5Ql0=;
 b=p20Y80X4M9Cg0pWpY78nG/Kt87z3GOpjwZcj4ISItR6cRaqBiGvSkbvqvksIZwfKwv
 rW5N1uDiIkXn/iaOxcNmevi4Q41Ao7oyQgkfvvSqo8JRIJ+1Od2SGfrn3tPYQRqAqW+H
 qbQxaeWNfVakPXFjF2dK7WXxL60gaFCAPSc6bRWw7oDcg+6/ApPr+8DgSqqez4z/zmBZ
 VGlykFmaK9y2UUM7toHZUMyfyqCcJkl+ZktP2o/6wfWsE2aEJvm1tfEBeoSA+VcVNVZY
 3KennaJF2a38itIjWv+DqVeMWLklIeZoS4Oy16GhawZavlU92YKuxArLB5gUYMBlAcuM
 0I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k+H22LYyuFn0P0Ry7ATW9f9JgbPKmhFRt6Rf8v/5Ql0=;
 b=HwRvr2KoCaE9K8EgQyNRiKpVnX0Yn4WaZlKpzgrDkUVhkPVMw7i9D6BS7IXZLq0u4i
 mwLaojtjPpBaofRAf8WaYK/YBB3mIcYKOs8aHE67kZHt5ADw873DMyRSBZa/W7E152Gh
 pbffW//IQTOQFAIk9+Ev+0T7onkSx02+M3PUBBfCwbIiKlDMlBfUC5Iz68QXvplntudm
 j/2wTdlMenacs5X5/y4X02eThVahQp1vCAUSjbg2qoJzeyMrg4kd58/n5BrMqwQrL5mx
 91KwhuwWTzxPoqBOeXNUM6PQpFan+lsvpBsu1RdRVqy+HxDwVGaW0MM9y65W26YeTeR+
 +0AA==
X-Gm-Message-State: AOAM5306+uIooow3Y7akIBLyfAzWy04qwnNJn43ERtDVsV0Hy10WlHea
 9EEriCyGvYYb80CYxDspkxo=
X-Google-Smtp-Source: ABdhPJwQHcU+DZ64oDg6SD8CcXTYw+1y1DcVIBKTuWap4hoSFp9OJj7pbJKvGhyeeBEaCCV4S01zgQ==
X-Received: by 2002:a63:1d52:: with SMTP id d18mr13785853pgm.450.1602510772957; 
 Mon, 12 Oct 2020 06:52:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id g85sm20541168pfb.4.2020.10.12.06.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 06:52:52 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201012054943.1196031-1-ujjwalkumar0501@gmail.com>
 <63053585d41ff81cdaad6cb727eb83d81207041a.camel@perches.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <5a3fc45f-e5d7-da3d-4b4b-2a23512ff8de@gmail.com>
Date: Mon, 12 Oct 2020 19:22:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <63053585d41ff81cdaad6cb727eb83d81207041a.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On 12/10/20 11:47 am, Joe Perches wrote:
> On Mon, 2020-10-12 at 11:19 +0530, Ujjwal Kumar wrote:
>> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
>> files. The script leverages filename extensions and its path in
>> the repository to decide whether to allow execute permissions on
>> the file or not.
>>
>> Based on current check conditions, a perl script file having
>> execute permissions, without '.pl' extension in its filename
>> and not belonging to 'scripts/' directory is reported as ERROR
>> which is a false-positive.
>>
>> Adding a shebang check along with current conditions will make
>> the check more generalised and improve checkpatch reports.
>> To do so, without breaking the core design decision of checkpatch,
>> we can fetch the first line from the patch itself and match it for
>> a shebang pattern.
>>
>> There can be cases where the first line is not part of the patch.
> 
> For instance: a patch that only changes permissions
> without changing any of the file content.
> 
>>
>> In that case there may be a false-positive report but in the end we
>> will have less false-positives as we will be handling some of the
>> unhandled cases.
> 
>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>> ---
>> Apologies, I forgot to include linux-kernel@vger.kernel.org so I'm
>> now resending.
>>
>>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -1795,6 +1795,23 @@ sub get_stat_here {
>>  	return $herectx;
>>  }
> 
> First some style trivia:
> 
>> +sub get_shebang {
>> +	my ($linenr, $realfile) = @_;
>> +	my $rawline = "";
>> +	my $shebang = "";
>> +
>> +	$rawline = raw_line($linenr, 3);
>> +	if (defined $rawline &&
>> +		$rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
> 
> alignment to open parenthesis please
> 
>> +		if (defined $1 && $1 == 1) {
>> +			$shebang = raw_line($linenr, 4);
>> +			$shebang = substr $shebang, 1;
> 
> parentheses around substr please.
> 
>> +		}
>> +	}
>> +
>> +	return $shebang;
>> +}
> 
> And some real notes:
> 
> $realfile isn't used in this function so there doesn't
> seem to be a reason to have it as an function argument.
> 
>> +
>>  sub cat_vet {
>>  	my ($vet) = @_;
>>  	my ($res, $coded);
>> @@ -2680,7 +2697,9 @@ sub process {
>>  # Check for incorrect file permissions
>>  		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
> 
> probably better here to use a capture group for the permissions
> 
> 		if ($line =~ /^new (?:file )?mode (\d+)$/) {
> 			my $mode = substr($1, -3);

This

> 
>>  			my $permhere = $here . "FILE: $realfile\n";
>> +			my $shebang = get_shebang($linenr, $realfile);
>>  			if ($realfile !~ m@scripts/@ &&
> 
> Maybe remove the $realfile directory test as
> there are many source files that are not scripts
> in this directory and its subdirectories.

this

> 
>> +			    $shebang !~ /^#!\s*(\/\w)+.*/ &&
> 
> unnecessary capture group
> 
> and add
> 
> 			   $mode =~ /[1357]/ &&

this

> 
>>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {
> 
> No need for a a capture group here either. (existing defect)

and this.

> 
>>  				ERROR("EXECUTE_PERMISSIONS",
>>  				      "do not set execute permissions for source files\n" . $permhere);
> 
> 
> 

Should these new changes go as a separate patch or can they be
included in the next iteration of this patch?



Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
