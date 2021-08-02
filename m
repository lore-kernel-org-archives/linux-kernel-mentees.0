Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E81C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 08:49:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF96760F36
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 08:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF96760F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74BD28300C;
	Mon,  2 Aug 2021 08:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHfPRjyBK519; Mon,  2 Aug 2021 08:49:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DDE5C82FDE;
	Mon,  2 Aug 2021 08:49:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBF05C001B;
	Mon,  2 Aug 2021 08:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6957BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54A45402C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8JfO7myV_9R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48E05400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:49:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u15so9922985wmj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=e6n/QkT9LI5TnOIxBPp2Y9oCnogYL4Oy7UiSuG2mUxs=;
 b=i47TLcFaCeCdD/6wxt+vvf6aAiO4Ri1qmPltlRaqQ/UyHydQdZfshPjU6K3zTKj/Z7
 5yUYgHB3w68k3ofkKT4/WWvNJtOTvapSM30KYg7eLr3QE13KcK2QTn54V5hr9v35Tf1M
 BoH83PMPypZD0ZSU2R0VuzqUdJ3VFMbtk2sIwbJrDsVv5PQeK8Zv9jITgaUWTzhDDBj+
 Q54pDNKXyd4nw7tfjvigGYyZDWDwWhlCQ6xMFt3Zp7kmSSQbo2eUshW5cB3qq/gC36ny
 5+0JZSIpV+HY4q8WVuBv11MeUYpEvsg/cTDVzivesPTgAgUDg55r1WCu8V+T+x37d2Js
 jVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=e6n/QkT9LI5TnOIxBPp2Y9oCnogYL4Oy7UiSuG2mUxs=;
 b=toSs6MfdcVJ5JboxE2uohP5fksOgwhcrImaKmtbxiBDlqX0HPMpvHEg80R93oZBxu0
 qR0w9AaPPu8bH/PBeToUym/39S9Z3FNDHqRXXRDtM9idb7lQy66vqT6mM4g4DBDQCEuv
 nfRzFO9qTaOqpmOuhFz85AOogvI3FtYqvZekI591gJIYNImW7WsZfPCrHza31psfg+yt
 U7cdH5yjtJHMlKrsoelwv/08nif3LpUDQ+4yeOnHe3QBN57N5Lv0BDUt1+/8KW5IVbFf
 mBJ2abB754CVqYPQHiQJoSZhxWHSZam1DJPrb6bMc36ZzaapRbdTm5MYxRYneKN1VHEx
 +tgA==
X-Gm-Message-State: AOAM530+JXMTVmD5769xyXcbl1JLVTPlGstw3yh4Q1w0+iph8VtdDCMr
 hzRcPuhXAtqubCGXR1cyoZ/AXGil0o0oCGEGdcg=
X-Google-Smtp-Source: ABdhPJyg1OWrrVjrFNoYXvONwpvhUOUNUs58gMCfPmx3b10FIlt/UCK8VLZUiwVtDkqNp5yPYQGyozIzi1XHyplfMao=
X-Received: by 2002:a1c:9d91:: with SMTP id g139mr15317977wme.76.1627894190266; 
 Mon, 02 Aug 2021 01:49:50 -0700 (PDT)
MIME-Version: 1.0
From: sri vathsa <srivathsa729.8@gmail.com>
Date: Mon, 2 Aug 2021 14:19:38 +0530
Message-ID: <CANx6jmf2nLZgcnardZ_VBUMLWTvhQbML7-OnLO575+sqFx_zjQ@mail.gmail.com>
Subject: RESEND: Checkpatch Documentation Task 1
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

I have cloned linux stable repository for this task.

Files that were assigned to me to run checkpatch.pl are:
drivers/usb/gadget/legacy/raw_gadget.c
drivers/video/fbdev/udlfb.c

$ ./scripts/checkpatch.pl --file --terse drivers/usb/gadget/legacy/raw_gadget.c

Result:

./drivers/usb/gadget/legacy/raw_gadget.c:52: WARNING: consider using a
completion
./drivers/usb/gadget/legacy/raw_gadget.c:262: WARNING: simple_strtoul
is obsolete, use kstrtoul instead
./drivers/usb/gadget/legacy/raw_gadget.c:701: WARNING: min() should
probably be min_t(unsigned int, io.length, ret)
./drivers/usb/gadget/legacy/raw_gadget.c:1078: WARNING: min() should
probably be min_t(unsigned int, io.length, ret)
total: 0 errors, 4 warnings, 1284 lines checked


$  ./scripts/checkpatch.pl --file --terse drivers/video/fbdev/udlfb.c

Result:

./drivers/video/fbdev/udlfb.c:82: ERROR: "foo * bar" should be "foo *bar"
./drivers/video/fbdev/udlfb.c:298: WARNING: Block comments should
align the * on each line
./drivers/video/fbdev/udlfb.c:577: WARNING: Missing a blank line after
declarations
./drivers/video/fbdev/udlfb.c:644: WARNING: Missing a blank line after
declarations
./drivers/video/fbdev/udlfb.c:822: WARNING: Missing a blank line after
declarations
./drivers/video/fbdev/udlfb.c:883: WARNING: Missing a blank line after
declarations
./drivers/video/fbdev/udlfb.c:926: WARNING: Prefer 'unsigned int' to
bare use of 'unsigned'
./drivers/video/fbdev/udlfb.c:926: WARNING: Prefer 'unsigned int' to
bare use of 'unsigned'
./drivers/video/fbdev/udlfb.c:926: WARNING: Prefer 'unsigned int' to
bare use of 'unsigned'
./drivers/video/fbdev/udlfb.c:927: WARNING: Prefer 'unsigned int' to
bare use of 'unsigned'
./drivers/video/fbdev/udlfb.c:927: WARNING: Prefer 'unsigned int' to
bare use of 'unsigned'
./drivers/video/fbdev/udlfb.c:1014: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1208: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1233: WARNING: Possible unnecessary 'out
of memory' message
./drivers/video/fbdev/udlfb.c:1257: WARNING: Possible unnecessary 'out
of memory' message
./drivers/video/fbdev/udlfb.c:1425: ERROR: open brace '{' following
function definitions go on the next line
./drivers/video/fbdev/udlfb.c:1429: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1433: ERROR: open brace '{' following
function definitions go on the next line
./drivers/video/fbdev/udlfb.c:1437: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1441: ERROR: open brace '{' following
function definitions go on the next line
./drivers/video/fbdev/udlfb.c:1445: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1449: ERROR: open brace '{' following
function definitions go on the next line
./drivers/video/fbdev/udlfb.c:1453: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1457: ERROR: open brace '{' following
function definitions go on the next line
./drivers/video/fbdev/udlfb.c:1479: ERROR: open brace '{' following
function definitions go on the next line
./drivers/video/fbdev/udlfb.c:1534: WARNING: Symbolic permissions
'S_IWUSR' are not preferred. Consider using octal permissions '0200'.
./drivers/video/fbdev/udlfb.c:1584: WARNING: Comparisons should place
the constant on the right side of the test
./drivers/video/fbdev/udlfb.c:1615: WARNING: Missing a blank line
after declarations
./drivers/video/fbdev/udlfb.c:1658: WARNING: Possible unnecessary 'out
of memory' message
./drivers/video/fbdev/udlfb.c:1888: WARNING: consider using a completion
./drivers/video/fbdev/udlfb.c:1978: WARNING: Symbolic permissions
'S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP' are not preferred. Consider
using octal permissions '0660'.
./drivers/video/fbdev/udlfb.c:1981: WARNING: Symbolic permissions
'S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP' are not preferred. Consider
using octal permissions '0660'.
./drivers/video/fbdev/udlfb.c:1984: WARNING: Symbolic permissions
'S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP' are not preferred. Consider
using octal permissions '0660'.
./drivers/video/fbdev/udlfb.c:1987: WARNING: Symbolic permissions
'S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP' are not preferred. Consider
using octal permissions '0660'.
./drivers/video/fbdev/udlfb.c:1991: WARNING: quoted string split across lines
./drivers/video/fbdev/udlfb.c:1992: WARNING: quoted string split across lines
total: 7 errors, 29 warnings, 1995 lines checked

---------------------------------------------------------

WARNING: Block comments should align the * on each line
(Documented)
All the '*' in multi-line comments must be aligned correctly to
form a straight line.

checkpatch.pl checks if '*' in multi-line comments
are at same distance from start of line or not.
If not then that means '*' are not aligned.
Following code raises wrong:

if (length($oldindent) ne length($newindent)) {
WARN("BLOCK_COMMENT_STYLE",
     "Block comments should align the * on each line\n" . $hereprev);
}

fix: all '*' are to be aligned to form a vertical
     straight line.

---------------------------------------------------------

ERROR: "foo * bar" should be "foo *bar"
(Documented)
While declaring pointer data-types or functions that return pointer
type data,
'*' must be adjacent to variable name or function name,
not next to data-types.

Wrong usages:
<data-type> * <variable-name>
or
<data-type>* <variable-name>

Correct usage:
<data-type> *<variable-name>

checkpatch.pl raises error if '*'s have spaces between them,
or if '*' have space on both of its sides.
checkpatch.pl also detects which wrong usage mentioned above
is implemented and raises error accordingly.

for this wrong usage:
<data-type> * <variable-name>

error msg will be:
ERROR: "foo * bar" should be "foo *bar"

for this wrong usage:
<data-type>* <variable-name>

error msg will be:
ERROR: "foo* bar" should be "foo *bar"

if ($from ne $to) {
if (ERROR("POINTER_LOCATION",
    "\"(foo$from)\" should be \"(foo$to)\"\n" .  $herecurr) && $fix) {
my $sub_from = $ident;
my $sub_to = $ident;
$sub_to =~ s/\Q$from\E/$to/;
$fixed[$fixlinenr] =~ s@\Q$sub_from\E@$sub_to@;
}
}

if ($from ne $to && $ident !~ /^$Modifier$/) {
if (ERROR("POINTER_LOCATION",
            "\"foo${from}bar\" should be \"foo${to}bar\"\n" .  $herecurr) &&
            $fix) {
my $sub_from = $match;
my $sub_to = $match;
$sub_to =~ s/\Q$from\E/$to/;
$fixed[$fixlinenr] =~ s@\Q$sub_from\E@$sub_to@;
        }
}

fix: '*' must be placed adjacent to variable or function name.

---------------------------------------------------------

WARNING: Missing a blank line after declarations
(Not Documented)
A line must be left blanck after declarations.

checkpatch.pl checks for declaration, if next is also declaration
checkpatch does nothing, instead if there is any other code
checkpatch.pl raises warning.

if (WARN("LINE_SPACING",
         "Missing a blank line after declarations\n" . $hereprev) &&
          $fix) {
fix_insert_line($fixlinenr, "\+");
}

fix: a line must be left blank after declarations.

---------------------------------------------------------

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
(Not Documented)
'unsigned int' should be used instead of just using 'unsigned'.

checkpatch.pl checks if it is specified unsigned or signed or just
bare data-type, if it is specified only unsigned, it raises warning.

if (WARN("UNSPECIFIED_INT",
         "Prefer '" . trim($sign) . " int" . rtrim($pointer) . "' to
bare use of '$sign" . rtrim($pointer) . "'\n" . $herecurr) &&
         $fix) {
my $decl = trim($sign) . " int ";
my $comp_pointer = $pointer;
$comp_pointer =~ s/\s//g;
$decl .= $comp_pointer;
$decl = rtrim($decl) if ($var eq "");
$fixed[$fixlinenr] =~ s@\b$sign\s*\Q$pointer\E\s*$var\b@$decl$var@;
}

fix: bare 'unsigned' should be replaced with 'unsigned int'

---------------------------------------------------------

WARNING: Possible unnecessary 'out of memory' message
(Not Documented)
Logging messages that show some type of "out of memory" error
are generally unnecessary as there is a generic message and
a stack dump done by the memory subsystem.
These messages generally increase kernel size without much
added value.
So, it's better to remove those messages.

checkpatch.pl checks if any unnecessary OOM messages or logged,
when a variable is compared with NULL in a if statement.
Then it raises warning.

if ($line =~ /^\+.*\b$logFunctions\s*\(/ &&
    $prevline =~ /^[
\+]\s*if\s*\(\s*(\!\s*|NULL\s*==\s*)?($Lval)(\s*==\s*NULL\s*)?\s*\)/
&&
    (defined $1 || defined $3) &&
    $linenr > 3) {
    my $testval = $2;
    my $testline = $lines[$linenr - 3];

    my ($s, $c) = ctx_statement_block($linenr - 3, $realcnt, 0);
#   print("line: <$line>\nprevline: <$prevline>\ns: <$s>\nc: <$c>\n\n\n");

     if ($s =~ /(?:^|\n)[
\+]\s*(?:$Type\s*)?\Q$testval\E\s*=\s*(?:\([^\)]*\)\s*)?\s*$allocFunctions\s*\(/
&&
     $s !~ /\b__GFP_NOWARN\b/ ) {
     WARN("OOM_MESSAGE",
     "Possible unnecessary 'out of memory' message\n" . $hereprev);
     }
}

fix: unnecessary logging oom messages should be avoided.
     In this case dev_err(args..) has to be removed.

---------------------------------------------------------

ERROR: open brace '{' following function definitions go on the next line
(Documentated)
According to kernel coding style while defining functions
opening brace must be on newline, should not be right after function name.

checkpatch.pl checks for open brace violation for many cases at a time,
for all cases except functional block open brace has to on same line, in case
functional blocks open braces have to be on new line.

if ($perl_version_ok &&
    $sline =~ /$Type\s*$Ident\s*$balanced_parens\s*\{/ &&
    $sline !~ /\#\s*define\b.*do\s*\{/ &&
    $sline !~ /}/) {
        if (ERROR("OPEN_BRACE",
                  "open brace '{' following function definitions go on
the next line\n" . $herecurr) &&
                  $fix) {
                  fix_delete_line($fixlinenr, $rawline);
                  my $fixed_line = $rawline;
                  $fixed_line =~ /(^..*$Type\s*$Ident\(.*\)\s*)\{(.*)$/;
                  my $line1 = $1;
                    my $line2 = $2;
                  fix_insert_line($fixlinenr, ltrim($line1));
                  fix_insert_line($fixlinenr, "\+{");
                  if ($line2 !~ /^\s*$/) {
                        fix_insert_line($fixlinenr, "\+\t" . trim($line2));
                       }
         }
}

fix: open brace must be placed in next line of function header line.

---------------------------------------------------------

WARNING: Symbolic permissions 'S_IWUSR' are not preferred. Consider
using octal permissions '0200'.
(Documented)
For permission bits, 4 digit octal permissions (like 0700 or 0444)
should be used, any other base, like decimal should be avoided.

checkpatch.pl checks for uses of S_<PERMS> that could be octal for
readability,
it also gets relevent octal, for S_<PERMS> used, also warns to
consider octal instead.

while ($line =~ m{\b($multi_mode_perms_string_search)\b}g) {
my $oval = $1;
my $octal = perms_to_octal($oval);
if (WARN("SYMBOLIC_PERMS",
  "Symbolic permissions '$oval' are not preferred. Consider using
octal permissions '$octal'.\n" . $herecurr) &&
                    $fix) {
                          $fixed[$fixlinenr] =~ s/\Q$oval\E/$octal/;
}
}

fix: octal permission '0200' has to be used instead of Symbolic permission.

---------------------------------------------------------

WARNING: Comparisons should place the constant on the right side of the test
(Documented)
While comparing with constant value, constant value should be placed
right side of the test.

checkpatch.pl checks for comparisions done with
constants or upper case identifiers on left. If such
compasrison is found then it raises warning.

if ($perl_version_ok &&
    $line =~ /^\+(.*)\b($Constant|[A-Z_][A-Z0-9_]*)\s*($Compare)\s*($LvalOrFunc)/)
{
my $lead = $1;
my $const = $2;
my $comp = $3;
my $to = $4;
my $newcomp = $comp;
if ($lead !~ /(?:$Operators|\.)\s*$/ &&
            $to !~ /^(?:Constant|[A-Z_][A-Z0-9_]*)$/ &&
            WARN("CONSTANT_COMPARISON",
                 "Comparisons should place the constant on the right
side of the test\n" . $herecurr) &&
                 $fix) {
        if ($comp eq "<") {
                                        $newcomp = ">";
                                } elsif ($comp eq "<=") {
                                        $newcomp = ">=";
                                } elsif ($comp eq ">") {
                                        $newcomp = "<";
                                } elsif ($comp eq ">=") {
                                        $newcomp = "<=";
                                }
                                $fixed[$fixlinenr] =~
s/\(\s*\Q$const\E\s*$Compare\s*\Q$to\E\s*\)/($to $newcomp $const)/;
                        }
}

fix: constant value is to placed right side of test.

---------------------------------------------------------

WARNING: consider using a completion
(Not Documented)
This warning suggests to use completion instead of semaphore.

checkpatch.pl checks for iniialized semaphores, by checking
for sema_init, if semaphores is initialized warns to use completion
instead of semaphore.

if ($line =~ /^.\s*sema_init.+,\W?0\W?\)/) {
       WARN("CONSIDER_COMPLETION",
            "consider using a completion\n" . $herecurr);
}

fix: completion has to be used instead of semaphore.

---------------------------------------------------------

WARNING: quoted string split across lines
(Documented)
According to kernel coding style, user visible strings can't be splited.
Because that breaks the ability to grep for them.

checkpatch.pl checks Check for user-visible strings broken across lines,
which breaks the ability to grep for the string. If previous string ends
with '\t', '\n', '\r', ';', or '{' (common in inline assembly) or
is a octal \123 or hexadecimal \xaf value they are not considered as
quoted string splits.

if ($line =~ /^\+\s*$String/ &&
$prevline =~ /"\s*$/ &&
$prevrawline !~
/(?:\\(?:[ntr]|[0-7]{1,3}|x[0-9a-fA-F]{1,2})|;\s*|\{\s*)"\s*$/) {
if (WARN("SPLIT_STRING",
         "quoted string split across lines\n" . $hereprev) &&
                         $fix &&
                         $prevrawline =~ /^\+.*"\s*$/ &&
                         $last_coalesced_string_linenr != $linenr - 1) {
                                my $extracted_string =
get_quoted_string($line, $rawline);
                                my $comma_close = "";
                                if ($rawline =~
/\Q$extracted_string\E(\s*\)\s*;\s*$|\s*,\s*)/) {
                                        $comma_close = $1;
                                }

                                fix_delete_line($fixlinenr - 1, $prevrawline);
                                fix_delete_line($fixlinenr, $rawline);
                                my $fixedline = $prevrawline;
                                $fixedline =~ s/"\s*$//;
                                $fixedline .=
substr($extracted_string, 1) . trim($comma_close);
                                fix_insert_line($fixlinenr - 1, $fixedline);
                                $fixedline = $rawline;
                                $fixedline =~
s/\Q$extracted_string\E\Q$comma_close\E//;
                                if ($fixedline !~ /\+\s*$/) {
                                        fix_insert_line($fixlinenr, $fixedline);
                                }
                                $last_coalesced_string_linenr = $linenr;
}
}

fix: user-readle strings must not be splited or '\n', '\t'
are to be used to supress warning.

---------------------------------------------------------

WARNING: simple_strtoul is obsolete, use kstrtoul instead
(Documented)
Usage of simple_strtol(), simple_strtoll(), simple_strtoul(),
and simple_strtoull() is not encouraged because these functions
explicitly ignore overflows, which may lead to unexpected results
in callers.
kstrtol(), kstrtoll(), kstrtoul(), and kstrtoull() functions
respectively tend to be the correct replacements.

checkpatch.pl recommends kstrto* over simple_strto* and strict_strto*,
it checks if simple_strto* or strict_strto* is used, and warns to use
corresponding kstrto*.

if ($line =~ /\b((simple|strict)_(strto(l|ll|ul|ull)))\s*\(/) {
        WARN("CONSIDER_KSTRTO",
             "$1 is obsolete, use k$3 instead\n" . $herecurr);
}

fix: kstrtoul has to be used insted of simple_strtoul

---------------------------------------------------------

WARNING: min() should probably be min_t(unsigned int, io.length, ret)
(Not Documented)
min_t() is prefered instead of using min() in this particular case,
because min_t() defined to return a minimum value of specified_type,
whereas min() return minimum value of same or related data-type.

checkpatch.pl checks if any min(), max() used while typecasting,
if used warns to used min_t(), max_t() respectively.

if ($perl_version_ok &&
    defined $stat &&
    $stat =~ /^\+(?:.*?)\b(min|max)\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\)/) {
        if (defined $2 || defined $7) {
             my $call = $1;
             my $cast1 = deparenthesize($2);
             my $arg1 = $3;
             my $cast2 = deparenthesize($7);
             my $arg2 = $8;
             my $cast;

             if ($cast1 ne "" && $cast2 ne "" && $cast1 ne $cast2) {
                       $cast = "$cast1 or $cast2";
              } elsif ($cast1 ne "") {
                       $cast = $cast1;
              } else {
                       $cast = $cast2;
              }
                       WARN("MINMAX",
                            "$call() should probably be
${call}_t($cast, $arg1, $arg2)\n" . "$here\n$stat\n");
              }
}

fix: min_t() has to be instead of min()

---------------------------------------------------------

Thanks,
Srivathsa Dara

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
