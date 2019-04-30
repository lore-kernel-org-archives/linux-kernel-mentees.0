From: bjorn.helgaas@gmail.com (Bjorn Helgaas)
Date: Tue, 30 Apr 2019 18:50:07 -0500
Subject: [Linux-kernel-mentees] [PATCH v2] Staging: rtl8192e: rtl8192e:
 Removed extra space before break statement
In-Reply-To: <633a89cb-4cf9-6885-c53c-94c8f1c0e924@linuxfoundation.org>
References: <20190430195903.GA30960@arch>
	<633a89cb-4cf9-6885-c53c-94c8f1c0e924@linuxfoundation.org>
Message-ID:
 <CABhMZUVycH6MyjS=EtEekg1dDV+piv+dw4s3bSXiGkte=rimUA@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430235007.I0gFz64437cxkimZvoxrZo17u4JKlkNsL1FF3adQQow@z>

On Tue, Apr 30, 2019 at 5:19 PM Shuah Khan <skhan at linuxfoundation.org> wrote:
>
> On 4/30/19 1:59 PM, Puranjay Mohan wrote:
> > Fixed a style issues reported by checkpatch.pl
> > break statements had extra spaces before them, so they didn't end at
> > tabstop. Removed the extra space before them to correct the issue.
>
> You could rephrase the above to say
>
> "Removed extra spaces before "break" statements to fix the following
> warnings from checkpatch.pl"

Here's a great post about commit logs: https://chris.beams.io/posts/git-commit/

One hint is to use the imperative mood, as though you're giving a
command, e.g., "Remove extra spaces ..."  That matches the messages
git generates for merges and reverts.  Chris says this is only
important in the subject line, not in the body, but I enforce it
everywhere.  I might be OCD.

It also conveniently matches the existing convention for the file:

$ git log --oneline drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
e4441911d969 staging: rtl8192e: fix various indentation issues
90be652c9f15 staging: rtl8192e: rtl92e_get_eeprom_size Fix read size
of EPROM_CMD.
867510bde14e staging: rtl8192e: fix 2 byte alignment of register BSSIDR.
baabd567f87b staging: rtl8192e: rtl92e_fill_tx_desc fix write to
mapped out memory.
a959dec11557 Staging: rtl8192e - fixed style of block comments
4db665e50ccc staging: rtl8192e: Remove useless type conversion
...

Some of those existing subjects include a period at the end
(definitely pointless) and also the function name (probably not really
useful here).  You should also match the existing capitalization
style.

General rule: the resulting code and logs should look like the work of
a single person, not a mixture of different styles.

Bjorn
