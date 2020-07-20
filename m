Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA28C433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 16:23:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725FC2070A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 16:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWh4HW8Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725FC2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4837486C11;
	Mon, 20 Jul 2020 16:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q70mbErItMIY; Mon, 20 Jul 2020 16:23:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 571CA8696A;
	Mon, 20 Jul 2020 16:23:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45060C0894;
	Mon, 20 Jul 2020 16:23:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7AF3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D547886C11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5P-CLYGCrIy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:23:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 003E38696A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 16:23:22 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t27so13784335ill.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 09:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OWFAaYoN+XCoJ7AgiWORga1TI9spDAaDAukT4gXW2bI=;
 b=WWh4HW8QHbh38QjtWamy8pjKHek67OYoPXbXu/t8qdSUvxpxAvvwRcd1e8ghA65ZQW
 BdO98zGhkfvSUuQ2l4T02KCFddz+7wA9S21Ubz/66RhBld+K9U8sWYd3GE/QqTizJy8K
 ouljlySRxiRljjjBHEBs3SSpEcECTwgxP2+CqjCGNOBc4m+mhtL5lVBhXaV9dHFcejMg
 pypo57WOF52np6QYS5CthqWEmBbWdWXOzAz6DDoduTD6n6AcBLhASvB2MD9WeXAlqCA2
 KEN0u8dZ2JQDltsObVpK2ioZFd0tQynvcF3ByaM8Ht32T7YYBwDH93tOm80xRJk6b9zP
 Lc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OWFAaYoN+XCoJ7AgiWORga1TI9spDAaDAukT4gXW2bI=;
 b=HcLODOvEo7aLlPcbM3TroQdqZezSHGwPKVlBUfa4u61J5GF9ZohEHy9qfQPXFtQEDT
 Lu22SzDd56f6g/GsH4pAlTL5BbM7CprHtWUk+1eNTcQsqMipJjqsozosfQEcHmOh+J14
 p+UqBNnMdYTyKG4hzAG7dUuCPXbB6EKuHmF62wlvUDYbnLHx/QbnROOcij7x4a81Jjr0
 o00v3iADONwNH4JMBy0FAby9Q+A0k5u9emTuRTs2tVW/aOllu8wAP/Tyt+UMXNkmwbDk
 FIBpLuwZTl416liDEp4+HZl21felzTX94omvzAEULJktEfqH8XyoDcIJNskKPQFZwzW+
 Sr0g==
X-Gm-Message-State: AOAM533M6rG7nFTzKbYvW8hSyX1K6xTAxKyWXSsh8LI5PbfFJ7g58tyF
 UR431Vq98NWckaaU+QKLse7cG4w7IDtFcWlcdPQ=
X-Google-Smtp-Source: ABdhPJwydeMoqycuRoz99SqTUeGodwoMjiPEKCrupMlT/1sWhOs1A2jppjnTRN7jP4zbGLVKTE/rZ6l8dTnLFxJfWCo=
X-Received: by 2002:a92:dc0c:: with SMTP id t12mr24400002iln.260.1595262202307; 
 Mon, 20 Jul 2020 09:23:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6602:22d1:0:0:0:0 with HTTP; Mon, 20 Jul 2020 09:23:21
 -0700 (PDT)
In-Reply-To: <CA+Dc07iQKrjZ7tPf1EpeT3c1w91aX1-tEbqzUX76Vh3X=1z9vA@mail.gmail.com>
References: <nachiketun8@gmail.com>
 <20200719171554.264462-1-nachiketun8@gmail.com>
 <CAKXUXMx3pkpY9Ud=VRf5EVVpr2ThvBTyF9Lr6Hw+CCRFvO7AbQ@mail.gmail.com>
 <CA+Dc07iQKrjZ7tPf1EpeT3c1w91aX1-tEbqzUX76Vh3X=1z9vA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 20 Jul 2020 18:23:21 +0200
Message-ID: <CAKXUXMw6xPe8=hmY9o9XptTURBSsbPtiH01CuLLEm+8kWg04Pg@mail.gmail.com>
To: Nachiket N <nachiketun8@gmail.com>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] Checkpatch: Disables commit
 length check/warning in commit log in case of valid signature tags
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
Content-Type: multipart/mixed; boundary="===============3025128257034857410=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3025128257034857410==
Content-Type: multipart/alternative; boundary="000000000000e4681005aae1ec6d"

--000000000000e4681005aae1ec6d
Content-Type: text/plain; charset="UTF-8"

On Monday, July 20, 2020, Nachiket N <nachiketun8@gmail.com> wrote:

> I did run checkpatch on the patch in the previous mail.
> Checkpatch.pl outputs warnings for commit description lines that exceed
> beyond 75 chars. Sometimes these lines might contain signature tags that
> cannot be
> shortened. The patch checks if the line has any valid signature tags and
> disables
> the warning in such a case.
> I tested it on patches which contain long commit log lines such as
> Reported-and-tested-by: syzbot+db339689b2101f6f6071@
> syzkaller.appspotmail.com
> in patch generated by commit ID ac854131d984.
> It does not output commit warning for in such cases.
>
>>
>>
Okay, this patch below is not ready for submission to the general mailing
list.

Please read the kernel documentation on proper preparation of a patch
submission.

Lukas


On Sun, Jul 19, 2020 at 11:07 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
>
>> Did you checkpatch this patch?
>>
>> You need to provide a rationale. Use a full checkpatch.pl evaluation
>> data for showing the difference before and after applying the patch.
>>
>> Lukas
>>
>> On So., 19. Juli 2020 at 19:16, Nachiket Naganure <nachiketun8@gmail.com>
>> wrote:
>>
>>> From: NachiketUN <nachiketun8@gmail.com>
>>>
>>> Signed-off-by: NachiketUN <nachiketun8@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 197436b20288..8db0f26601c5 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2799,7 +2799,7 @@ sub process {
>>>
>>>  # Check for line lengths > 75 in commit log, warn once
>>>                 if ($in_commit_log && !$commit_log_long_line &&
>>> -                   length($line) > 75 &&
>>> +                   length($line) > 75 && $line !~ /$signature_tags/ &&
>>>                     !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
>>>                                         # file delta changes
>>>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
>>> --
>>> 2.25.1
>>>
>>>

--000000000000e4681005aae1ec6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, July 20, 2020, Nachiket N &lt;<a href=3D"mailto:nachiket=
un8@gmail.com">nachiketun8@gmail.com</a>&gt; wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div>I did run checkpatch on the patch in the p=
revious mail.</div><div>Checkpatch.pl outputs warnings for commit descripti=
on lines that exceed<br>beyond 75 chars. Sometimes these lines might contai=
n signature tags that cannot be<br>shortened. The patch checks if the line =
has any valid signature tags and disables<br>the warning in such a case.</d=
iv><div>I tested it on patches which contain long commit log lines such as<=
/div><div>Reported-and-tested-by: <a href=3D"mailto:syzbot%2Bdb339689b2101f=
6f6071@syzkaller.appspotmail.com" target=3D"_blank">syzbot+db339689b2101f6f=
6071@<wbr>syzkaller.appspotmail.com</a></div><div>in patch generated by com=
mit ID ac854131d984.</div><div>It does not output commit warning for in suc=
h cases.</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote></block=
quote><div><br></div><div>Okay, this patch below is not ready for submissio=
n to the general mailing list.</div><div><br></div><div>Please read the ker=
nel documentation on proper preparation of a patch submission.</div><div><b=
r></div><div>Lukas</div><div><br></div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sun, Jul 19, 2020 at 11:07 PM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.=
bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=
=3D"auto">Did you checkpatch this patch?</div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">You need to provide a rationale. Use a full <a href=
=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a> evaluation da=
ta for showing the difference before and after applying the patch.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div><br><div class=
=3D"gmail_quote"><div>On So., 19. Juli 2020 at 19:16, Nachiket Naganure &lt=
;<a href=3D"mailto:nachiketun8@gmail.com" target=3D"_blank">nachiketun8@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: NachiketUN &lt;<a href=3D"mailto:nachiketun8@gmail.com" target=
=3D"_blank">nachiketun8@gmail.com</a>&gt;<br>
<br>
Signed-off-by: NachiketUN &lt;<a href=3D"mailto:nachiketun8@gmail.com" targ=
et=3D"_blank">nachiketun8@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 197436b20288..8db0f26601c5 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -2799,7 +2799,7 @@ sub process {<br>
<br>
=C2=A0# Check for line lengths &gt; 75 in commit log, warn once<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($in_commit_log =
&amp;&amp; !$commit_log_long_line &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lengt=
h($line) &gt; 75 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lengt=
h($line) &gt; 75 &amp;&amp; $line !~ /$signature_tags/ &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !($li=
ne =3D~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+<wbr>\d+/ ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file d=
elta changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $line =3D~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]<wbr>+:/ ||<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>
</blockquote></div>
</blockquote>

--000000000000e4681005aae1ec6d--

--===============3025128257034857410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3025128257034857410==--
