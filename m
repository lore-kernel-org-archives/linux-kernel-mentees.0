From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 30 Apr 2019 16:18:37 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] Staging: rtl8192e: rtl8192e:
 Removed extra space before break statement
In-Reply-To: <20190430195903.GA30960@arch>
References: <20190430195903.GA30960@arch>
Message-ID: <633a89cb-4cf9-6885-c53c-94c8f1c0e924@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 4/30/19 1:59 PM, Puranjay Mohan wrote:
> Fixed a style issues reported by checkpatch.pl
> break statements had extra spaces before them, so they didn't end at
> tabstop. Removed the extra space before them to correct the issue.

You could rephrase the above to say

"Removed extra spaces before "break" statements to fix the following
warnings from checkpatch.pl"

<add warning here>

> WARNING: Statements should start on a tabstop
> +		 break;
> WARNING: Statements should start on a tabstop
> +		 break;
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>

Your subject line has duplicate information:

rtl8192e twice?

thanks,
-- Shuah
