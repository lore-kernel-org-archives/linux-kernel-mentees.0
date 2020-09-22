Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C84C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 18:38:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB07320715
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 18:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOeWXZZn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB07320715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4110C870D3;
	Tue, 22 Sep 2020 18:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noZAgreUUVkA; Tue, 22 Sep 2020 18:38:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 836E4870D2;
	Tue, 22 Sep 2020 18:38:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67660C0889;
	Tue, 22 Sep 2020 18:38:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65EABC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 18:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 48E2384E38
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 18:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKUMCrJCBohU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 18:38:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2028E84D06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 18:38:20 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id n22so17191752edt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=A7w2ZMW4vXWbu6pMgGVYZTEZGiKostRbX21wv5Kqxpk=;
 b=dOeWXZZniCNjkhmuS1el16yCn1CUKLsPxGPXQHYorh5V+l2CVw16gHzbOzc5daHxDo
 nPiLFi+3wVZN9IqkGFWpw7inMm3PY5DyyC/X0uZ5rBQwswJMLV0EdjzVZZmFEj6CBk3K
 5jTJ7devbloTGucSIHcBkCB34e8Oo7dopBsWtx9QRC6gev6jiChn/EmVzQSROqjR3SbL
 7itwBgm6mqvRmpESSWGorX+ZivJ+pWJvZSNAdCKS0n1XPNwOAhTiCmaBOE92PjZ1YcLX
 kR5Do+6ejeeYTjMqgcQxyxD3z2YvRzfqmnogzxzZr5eKt+P5UW2UY/qlzLeWcUz0Z9/K
 mI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=A7w2ZMW4vXWbu6pMgGVYZTEZGiKostRbX21wv5Kqxpk=;
 b=hf0rAUT0WQh0Na1sYhQvSZCrj9eBJCT6PtrxANabs7P1Ubpe3Ag/6pkpTdVuuenect
 d2weSSaKDk3KoMPcwVlYq5EgBV0RKM4UjfZr73RtHvEIlMXyld16lesIgNn9UTaAFfit
 aDcwFY6sSvGcwdj8+lgMxBkE6N9PzIKkXzWeqedMl8b8mZfDNvVg+J3iy6Rs+gQa5l89
 /EvfWQ9jjUPml6OM+adttsKd+5W6aPsxtffrWAXZPPOF/MOjuFWnCR8H2BLRwNXKDf2O
 t4rpHs4r5F9vysrLr14cbt1/FrKMoJrtpMXw061pl8iSrBjYetY24mMxnAEUU/MQOqJ2
 0nNA==
X-Gm-Message-State: AOAM532hwaplrbavs60vyT2OyxhoIcZZqGKdAGgueuMbZkFcs87Wwary
 JnKVaDBNTCXHXUpYlDT1S5Q=
X-Google-Smtp-Source: ABdhPJyxtRKBkXrCVYAPDWrgafgWJF09ad+VRjxcW/f35t3E3vwYl3voLI0/fFrY8/COR5uhoKoeNQ==
X-Received: by 2002:a50:fc0b:: with SMTP id i11mr5371498edr.164.1600799898199; 
 Tue, 22 Sep 2020 11:38:18 -0700 (PDT)
Received: from felia ([2001:16b8:2d21:d600:24ff:e57a:e050:81f7])
 by smtp.gmail.com with ESMTPSA id w11sm11578448edx.81.2020.09.22.11.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 11:38:17 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 22 Sep 2020 20:38:10 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009222028250.20644@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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



On Tue, 22 Sep 2020, Dwaipayan Ray wrote:

> Hi Lukas,
> 
> I looked up the mailmap implementations in get_maintainers
> and I was able to draw up something. After that I updated
> .mailmap with Daniel's mail addresses and ran the
> checkpatch script on some of Daniel Vetter's commits and
> the author sign off warning no longer appears :).
> 
> Let me know what you think of this.
> I am sending you the diff for now.
>

Generally, I think it is a good first proof of concept.
I believe you that functionality 'basically' works; again, we might 
already want to run a full-scale evaluation on that. Just to see
if there are some impacts we might not be aware of yet.

As you already wrote, we, Joe, you and me, need to figure out
now all the further details:

- how can we avoid the duplicate code in checkpatch.pl and 
get_maintainers.pl?
 
- what is performance impact, especially as AUTHOR_SIGN_OFF check is not 
triggered often, and there are many other rules in checkpatch.pl?

- further details, such as why do we need the lk_path is the first place? 
and many more questions of that kind.

Feel free to sketch a first commit message and create a PATCH RFC for the 
discussion with Joe.


Lukas

> Thanks,
> Dwaipayan.
> 
> --------------------------------------------------------
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9e65d21456f1..e8c12a5a7e7b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -51,6 +51,7 @@ my %ignore_type = ();
>  my @ignore = ();
>  my $help = 0;
>  my $configuration_file = ".checkpatch.conf";
> +my $lk_path = "./";
>  my $max_line_length = 100;
>  my $ignore_perl_version = 0;
>  my $minimum_perl_version = 5.10.0;
> @@ -1128,6 +1129,78 @@ sub top_of_kernel_tree {
>   return 1;
>  }
> 
> +my $mailmap;
> +
> +sub read_mailmap {
> +    $mailmap = {
> + names => {},
> + addresses => {}
> +    };
> +
> +    return if (!defined($lk_path) || !(-f "${lk_path}.mailmap"));
> +
> +    open(my $mailmap_file, '<', "${lk_path}.mailmap")
> + or warn "$P: Can't open .mailmap: $!\n";
> +
> +    while (<$mailmap_file>) {
> + s/#.*$//; #strip comments
> + s/^\s+|\s+$//g; #trim
> +
> + next if (/^\s*$/); #skip empty lines
> + #entries have one of the following formats:
> + # name1 <mail1>
> + # <mail1> <mail2>
> + # name1 <mail1> <mail2>
> + # name1 <mail1> name2 <mail2>
> + # (see man git-shortlog)
> +
> + if (/^([^<]+)<([^>]+)>$/) {
> +     my $real_name = $1;
> +     my $address = $2;
> +
> +     $real_name =~ s/\s+$//;
> +     ($real_name, $address) = parse_email("$real_name <$address>");
> +     $mailmap->{names}->{$address} = $real_name;
> +
> + } elsif (/^<([^>]+)>\s*<([^>]+)>$/) {
> +     my $real_address = $1;
> +     my $wrong_address = $2;
> +
> +     $mailmap->{addresses}->{$wrong_address} = $real_address;
> +
> + } elsif (/^(.+)<([^>]+)>\s*<([^>]+)>$/) {
> +     my $real_name = $1;
> +     my $real_address = $2;
> +     my $wrong_address = $3;
> +
> +     $real_name =~ s/\s+$//;
> +     ($real_name, $real_address) =
> +   parse_email("$real_name <$real_address>");
> +     $mailmap->{names}->{$wrong_address} = $real_name;
> +     $mailmap->{addresses}->{$wrong_address} = $real_address;
> +
> + } elsif (/^(.+)<([^>]+)>\s*(.+)\s*<([^>]+)>$/) {
> +     my $real_name = $1;
> +     my $real_address = $2;
> +     my $wrong_name = $3;
> +     my $wrong_address = $4;
> +
> +     $real_name =~ s/\s+$//;
> +     ($real_name, $real_address) =
> +   parse_email("$real_name <$real_address>");
> +
> +     $wrong_name =~ s/\s+$//;
> +     ($wrong_name, $wrong_address) =
> +   parse_email("$wrong_name <$wrong_address>");
> +
> +     my $wrong_email = format_email($wrong_name, $wrong_address);
> +     $mailmap->{names}->{$wrong_email} = $real_name;
> +     $mailmap->{addresses}->{$wrong_email} = $real_address;
> + }
> +    }
> +    close($mailmap_file);
> +}
> +
>  sub parse_email {
>   my ($formatted_email) = @_;
> 
> @@ -1210,14 +1283,50 @@ sub reformat_email {
>   return format_email($email_name, $email_address);
>  }
> 
> +sub mailmap_email {
> +    my ($name, $address) = @_;
> +
> +    my $email = format_email($name, $address);
> +    my $real_name = $name;
> +    my $real_address = $address;
> +
> +    if (exists $mailmap->{names}->{$email} ||
> + exists $mailmap->{addresses}->{$email}) {
> + if (exists $mailmap->{names}->{$email}) {
> +     $real_name = $mailmap->{names}->{$email};
> + }
> + if (exists $mailmap->{addresses}->{$email}) {
> +     $real_address = $mailmap->{addresses}->{$email};
> + }
> +    } else {
> + if (exists $mailmap->{names}->{$address}) {
> +     $real_name = $mailmap->{names}->{$address};
> + }
> + if (exists $mailmap->{addresses}->{$address}) {
> +     $real_address = $mailmap->{addresses}->{$address};
> + }
> +    }
> +    return ($real_name, $real_address);
> +}
> +
>  sub same_email_addresses {
>   my ($email1, $email2) = @_;
> 
>   my ($email1_name, $name1_comment, $email1_address, $comment1) =
> parse_email($email1);
>   my ($email2_name, $name2_comment, $email2_address, $comment2) =
> parse_email($email2);
> 
> - return $email1_name eq $email2_name &&
> -        $email1_address eq $email2_address;
> + my $name_match = $email1_name eq $email2_name;
> + my $address_match = $email1_address eq $email2_address;
> +
> + if(!$name_match || !$address_match) {
> +   my ($real_name1, $real_address1) = mailmap_email($email1_name,
> $email1_address);
> +   my ($real_name2, $real_address2) = mailmap_email($email2_name,
> $email2_address);
> +
> +   $name_match |= ($real_name1 eq $real_name2);
> +   $address_match |= ($real_address1 eq $real_address2);
> + }
> +
> + return $name_match && $address_match;
>  }
> 
>  sub which {
> @@ -2400,6 +2509,7 @@ sub process {
> 
>   my $checklicenseline = 1;
> 
> + read_mailmap();
>   sanitise_line_reset();
>   my $line;
>   foreach my $rawline (@rawlines) {
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
