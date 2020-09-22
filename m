Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74258C2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 13:22:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D384F206C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 13:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VumBVcYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D384F206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDB91872B2;
	Tue, 22 Sep 2020 13:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g215mU58ZPIB; Tue, 22 Sep 2020 13:22:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E5EA870C2;
	Tue, 22 Sep 2020 13:22:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1527CC0051;
	Tue, 22 Sep 2020 13:22:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD7DDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 13:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA5AE85657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 13:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-dfb3x_-f43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 13:22:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3E478574B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 13:21:59 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id u126so20964475oif.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PdQmdz+85aTlR0pAb6JtFpPaOGmvu8UxWLYncsnq4kI=;
 b=VumBVcYsFGHxNJvXfFnZhRqf17XXy4gZgnYX8H7gUyb7b9vRelwOQfhZL1rPXypOb8
 AVRB/uRksrbn0K8xvEXZ5la2b63ygopnI98KlKArXMbQ4Dh6pyOL8aiCC+JlfktbUnKT
 POTAFsehf2y6usnhw8nAF1xwC/Z3Sr+JTrhysY2KqzzC86/Qdl/LCQEg7ybxlckSMg56
 GWutEzB/D1c6mNX6zkeCU+giTlVqCaJdNWG7Fyp9aGegEH1elj/FUkqMG2KoAji5GFg9
 0uKUBfYRXBGHdVUJi46J2dbbKb3kOjIaBiaxbJPiwf2Qzq9oa7lJsacXR3aO5DLu7Bg0
 tvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PdQmdz+85aTlR0pAb6JtFpPaOGmvu8UxWLYncsnq4kI=;
 b=s6MZkki24nsqXpxeAEk+EyE0Jq+riCDz3Ksis0wH9ahW/8hZ8yuCxitkSrjh7b0NZU
 I0GXnEheDMW+bwIkje7906Rd4dmqWMsl9dXGpcc23Rs8h1AXOgEEuqPEB1zLc1xlL/GC
 m9MG4S3wF6cgLhlBM/6zHY+OropGfJEbMkmXwGWSvnK9OQ0ASDfuaCQkS2L14/fwoMve
 t+8o0i3cwWi1FJrhQ5mMKz564pNmKQ0HbOTo+iIN40Kv3/K4YtDaZMPTzjO/6rAVU46x
 q+HOIU3qulM8DCMCixZUbOzqb2p67eHIT58dDA6uxG1wKqbCzdyBM8XH+y7zwinZEKOL
 94BQ==
X-Gm-Message-State: AOAM532NliyNS53Jakw8JOSx0R3xaZ03H8LEX43IYckJWnnMaxDrl2dg
 xqD4OLBK0La2b9IzHczde1YdQKu1Iqy/tOeq2FM=
X-Google-Smtp-Source: ABdhPJx4VkkKbN5Bdo7tdlxEySZf6gtR9ujq+Iv2yxQ4rUqJTAkxHVkCGAc+ZApMgCK1gRR/xKZb6PNixaYrmytN9DU=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr2470579oih.117.1600780918882; 
 Tue, 22 Sep 2020 06:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
In-Reply-To: <alpine.DEB.2.21.2009211112460.7483@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 22 Sep 2020 18:51:39 +0530
Message-ID: <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

Hi Lukas,

I looked up the mailmap implementations in get_maintainers
and I was able to draw up something. After that I updated
.mailmap with Daniel's mail addresses and ran the
checkpatch script on some of Daniel Vetter's commits and
the author sign off warning no longer appears :).

Let me know what you think of this.
I am sending you the diff for now.

Thanks,
Dwaipayan.

--------------------------------------------------------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9e65d21456f1..e8c12a5a7e7b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -51,6 +51,7 @@ my %ignore_type = ();
 my @ignore = ();
 my $help = 0;
 my $configuration_file = ".checkpatch.conf";
+my $lk_path = "./";
 my $max_line_length = 100;
 my $ignore_perl_version = 0;
 my $minimum_perl_version = 5.10.0;
@@ -1128,6 +1129,78 @@ sub top_of_kernel_tree {
  return 1;
 }

+my $mailmap;
+
+sub read_mailmap {
+    $mailmap = {
+ names => {},
+ addresses => {}
+    };
+
+    return if (!defined($lk_path) || !(-f "${lk_path}.mailmap"));
+
+    open(my $mailmap_file, '<', "${lk_path}.mailmap")
+ or warn "$P: Can't open .mailmap: $!\n";
+
+    while (<$mailmap_file>) {
+ s/#.*$//; #strip comments
+ s/^\s+|\s+$//g; #trim
+
+ next if (/^\s*$/); #skip empty lines
+ #entries have one of the following formats:
+ # name1 <mail1>
+ # <mail1> <mail2>
+ # name1 <mail1> <mail2>
+ # name1 <mail1> name2 <mail2>
+ # (see man git-shortlog)
+
+ if (/^([^<]+)<([^>]+)>$/) {
+     my $real_name = $1;
+     my $address = $2;
+
+     $real_name =~ s/\s+$//;
+     ($real_name, $address) = parse_email("$real_name <$address>");
+     $mailmap->{names}->{$address} = $real_name;
+
+ } elsif (/^<([^>]+)>\s*<([^>]+)>$/) {
+     my $real_address = $1;
+     my $wrong_address = $2;
+
+     $mailmap->{addresses}->{$wrong_address} = $real_address;
+
+ } elsif (/^(.+)<([^>]+)>\s*<([^>]+)>$/) {
+     my $real_name = $1;
+     my $real_address = $2;
+     my $wrong_address = $3;
+
+     $real_name =~ s/\s+$//;
+     ($real_name, $real_address) =
+   parse_email("$real_name <$real_address>");
+     $mailmap->{names}->{$wrong_address} = $real_name;
+     $mailmap->{addresses}->{$wrong_address} = $real_address;
+
+ } elsif (/^(.+)<([^>]+)>\s*(.+)\s*<([^>]+)>$/) {
+     my $real_name = $1;
+     my $real_address = $2;
+     my $wrong_name = $3;
+     my $wrong_address = $4;
+
+     $real_name =~ s/\s+$//;
+     ($real_name, $real_address) =
+   parse_email("$real_name <$real_address>");
+
+     $wrong_name =~ s/\s+$//;
+     ($wrong_name, $wrong_address) =
+   parse_email("$wrong_name <$wrong_address>");
+
+     my $wrong_email = format_email($wrong_name, $wrong_address);
+     $mailmap->{names}->{$wrong_email} = $real_name;
+     $mailmap->{addresses}->{$wrong_email} = $real_address;
+ }
+    }
+    close($mailmap_file);
+}
+
 sub parse_email {
  my ($formatted_email) = @_;

@@ -1210,14 +1283,50 @@ sub reformat_email {
  return format_email($email_name, $email_address);
 }

+sub mailmap_email {
+    my ($name, $address) = @_;
+
+    my $email = format_email($name, $address);
+    my $real_name = $name;
+    my $real_address = $address;
+
+    if (exists $mailmap->{names}->{$email} ||
+ exists $mailmap->{addresses}->{$email}) {
+ if (exists $mailmap->{names}->{$email}) {
+     $real_name = $mailmap->{names}->{$email};
+ }
+ if (exists $mailmap->{addresses}->{$email}) {
+     $real_address = $mailmap->{addresses}->{$email};
+ }
+    } else {
+ if (exists $mailmap->{names}->{$address}) {
+     $real_name = $mailmap->{names}->{$address};
+ }
+ if (exists $mailmap->{addresses}->{$address}) {
+     $real_address = $mailmap->{addresses}->{$address};
+ }
+    }
+    return ($real_name, $real_address);
+}
+
 sub same_email_addresses {
  my ($email1, $email2) = @_;

  my ($email1_name, $name1_comment, $email1_address, $comment1) =
parse_email($email1);
  my ($email2_name, $name2_comment, $email2_address, $comment2) =
parse_email($email2);

- return $email1_name eq $email2_name &&
-        $email1_address eq $email2_address;
+ my $name_match = $email1_name eq $email2_name;
+ my $address_match = $email1_address eq $email2_address;
+
+ if(!$name_match || !$address_match) {
+   my ($real_name1, $real_address1) = mailmap_email($email1_name,
$email1_address);
+   my ($real_name2, $real_address2) = mailmap_email($email2_name,
$email2_address);
+
+   $name_match |= ($real_name1 eq $real_name2);
+   $address_match |= ($real_address1 eq $real_address2);
+ }
+
+ return $name_match && $address_match;
 }

 sub which {
@@ -2400,6 +2509,7 @@ sub process {

  my $checklicenseline = 1;

+ read_mailmap();
  sanitise_line_reset();
  my $line;
  foreach my $rawline (@rawlines) {
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
